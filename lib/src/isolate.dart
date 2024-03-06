import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:ffi/ffi.dart';

import 'exception.dart';
import 'gs_iapi.dart';
import 'isolate_messages.dart';
import 'models.dart';

const String _libName = 'gsdll64';

final DynamicLibrary _dylib = () {
  try {
    if (Platform.isMacOS || Platform.isIOS) {
      return DynamicLibrary.open('$_libName.framework/$_libName');
    }
    if (Platform.isAndroid || Platform.isLinux) {
      return DynamicLibrary.open('lib$_libName.so');
    }
    if (Platform.isWindows) {
      return DynamicLibrary.open('$_libName.dll');
    }
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  } on ArgumentError {
    throw UnsupportedError("Ensure Ghostscript is installed");
  }
}();

/// The bindings to the native functions in [_dylib].
final GhostscriptDartBindings _gsapi = GhostscriptDartBindings(_dylib);

int isolateRequestId = 0;
final Map<int, Completer<IsolateResponse>> isolateResponses = {};

class IsolateRequest {
  final int id;
  final GsRequest request;
  const IsolateRequest(this.id, this.request);
}

class IsolateResponse {
  final int id;
  final GsResponse response;
  const IsolateResponse(this.id, this.response);
}

GhostscriptRevision gsapi_revision() {
  final len = sizeOf<gsapi_revision_s>();
  final Pointer<gsapi_revision_s> ptr = malloc.allocate(len);
  final code = _gsapi.revision(ptr.cast(), len);

  if (code != 0) {
    throw GhostscriptDartException("gsapi_revision", code);
  }
  final value = ptr.ref;
  final revision = GhostscriptRevision(
    product: value.product.cast<Utf8>().toDartString(),
    copyright: value.copyright.cast<Utf8>().toDartString(),
    revision: value.revision,
    revisionDate: value.revisiondate,
  );
  malloc.free(ptr);
  return revision;
}

/// The SendPort belonging to the helper isolate.
Future<SendPort> helperIsolateSendPortFuture = () async {
  // The helper isolate is going to send us back a SendPort,
  // which we want to wait for
  final Completer<SendPort> completer = Completer();

  // Receive port on the main isolate to receive messages from the helper
  // We receive two types of messages:
  // 1. A port to send messages on.
  // 2. Responses to requests we sent.
  final ReceivePort responseReceivePort = ReceivePort()
    ..listen((data) {
      if (data is SendPort) {
        // The helper isolate sent us the port on which we can send it requests
        completer.complete(data);
        return;
      }
      if (data is IsolateResponse) {
        // The helper isolate sent us a response to a request we sent.
        final requestId = data.id;
        final completer = isolateResponses.remove(requestId);
        if (completer == null) {
          throw StateError("Referencing invalid request ID $requestId");
        }
        completer.complete(data);
        return;
      }
      throw UnsupportedError("Unsupported message type: ${data.runtimeType}");
    });

  // Start the helper isolate responsible for managing instances.
  await Isolate.spawn((SendPort sendPort) {
    final Map<int, Pointer<Pointer<Void>>> _instancePtrs = {};
    int _instanceId = 0;

    final ReceivePort requestReceivePort = ReceivePort()
      ..listen((data) {
        // On the helper isolate, listen to requests and respond to them.
        if (data is! IsolateRequest) {
          throw UnsupportedError(
              "Unsupported message type: ${data.runtimeType}");
        }
        final requestId = data.id;
        final request = data.request;
        if (request is NewInstanceRequest) {
          final i = _instanceId++;
          final Pointer<Pointer<Void>> _gsapiInstancePtr = malloc.allocate(1);
          _gsapiInstancePtr.value = nullptr;
          final result = _gsapi.new_instance(_gsapiInstancePtr, nullptr);
          // assert(_instancePtrs[i] == null);
          if (_instancePtrs[i] != null) {
            throw StateError("Already exists instance with id $i");
          }
          _instancePtrs[i] = _gsapiInstancePtr;
          final response = NewInstanceResponse(i, result);
          sendPort.send(IsolateResponse(requestId, response));
          return;
        }
        if (request is! GsInstanceRequest) {
          throw UnsupportedError(
              "Unsupported message type: ${data.runtimeType}");
        }
        final instanceId = request.instanceId;
        final instancePtr = _instancePtrs[instanceId];
        if (instancePtr == null) {
          throw StateError("No instance with id $instanceId");
        }
        final instance = instancePtr.value;
        if (instance == nullptr) {
          throw StateError(
              "Reference to nullptr in instance with id $instanceId");
        }
        // assert(instance != nullptr);
        switch (request) {
          case final SetArgEncodingRequest request:
            final encoding = request.encoding;
            final result = _gsapi.set_arg_encoding(instance, encoding);
            final response = SetArgEncodingResponse(instanceId, result);
            sendPort.send(IsolateResponse(requestId, response));
            return;
          case final InitWithArgsRequest request:
            final arguments = request.arguments;
            final argc = arguments.length;
            final Pointer<Pointer<Char>> argv = malloc.allocate(argc);
            for (final (index, charPtr) in arguments.indexed) {
              argv[index] = charPtr.toNativeUtf8().cast();
            }
            final result = _gsapi.init_with_args(instance, argc, argv);
            final response = InitWithArgsResponse(instanceId, result);
            // errors without waiting
            sleep(const Duration(seconds: 5));
            // cleanup
            for (var i = 0; i < argc; i++) {
              malloc.free(argv[i]);
            }
            malloc.free(argv);
            sendPort.send(IsolateResponse(requestId, response));
            return;
          case ExitRequest():
            final result = _gsapi.exit(instance);
            final response = ExitResponse(instanceId, result);
            sendPort.send(IsolateResponse(requestId, response));
            return;
          case DeleteInstanceRequest():
            _gsapi.delete_instance(instance);
            final response = DeleteInstanceResponse(instanceId);
            final pointer = _instancePtrs.remove(instanceId);
            if (pointer != null) {
              malloc.free(pointer);
            }
            sendPort.send(IsolateResponse(requestId, response));
            return;
        }
      });
    sendPort.send(requestReceivePort.sendPort);
  }, responseReceivePort.sendPort);
  return completer.future;
}();
