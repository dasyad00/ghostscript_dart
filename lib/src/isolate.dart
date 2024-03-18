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

// final DynamicLibrary _dylib = getDyLib(_libName);
final DynamicLibrary gsdart_lib = getDyLib("ghostscript_dart");
DynamicLibrary getDyLib(String libName) {
  try {
    if (Platform.isMacOS || Platform.isIOS) {
      return DynamicLibrary.open('$libName.framework/$libName');
    }
    if (Platform.isAndroid || Platform.isLinux) {
      return DynamicLibrary.open('lib$libName.so');
    }
    if (Platform.isWindows) {
      return DynamicLibrary.open('$libName.dll');
    }
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  } on ArgumentError {
    throw UnsupportedError("Ensure Ghostscript is installed");
  }
}

/// The bindings to the native functions in [_dylib].
// final GhostscriptDartBindings _gsapi = GhostscriptDartBindings(_dylib);
final GhostscriptDartBindings gsapi = GhostscriptDartBindings(gsdart_lib);

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
  // final code = _gsapi.revision(ptr.cast(), len);
  final code = gsapi.gsdart_revision(ptr.cast(), len);

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
  // malloc.free(ptr);
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
    // final Map<int, Pointer<Pointer<Void>>> _instancePtrs = {};
    // int _instanceId = 0;
    final ReceivePort requestReceivePort = ReceivePort()
      ..listen((data) {
        // On the helper isolate, listen to requests and respond to them.
        if (data is! IsolateRequest) {
          throw UnsupportedError(
              "Unsupported message type: ${data.runtimeType}");
        }
        final response = processIsolateRequest(data);
        sendPort.send(response);
      });
    sendPort.send(requestReceivePort.sendPort);
  }, responseReceivePort.sendPort);
  return completer.future;
}();

IsolateResponse processIsolateRequest(IsolateRequest isolateRequest) {
  final requestId = isolateRequest.id;
  final request = isolateRequest.request;
  if (request is NewInstanceRequest) {
    const i = 0;
    // final i = _instanceId++;
    // final Pointer<Pointer<Void>> _gsapiInstancePtr = malloc.allocate(1);
    // _gsapiInstancePtr.value = nullptr;
    final result = gsapi.gsdart_new_instance();
    // final result = _gsapi.new_instance(_gsapiInstancePtr, nullptr);
    // assert(_instancePtrs[i] == null);
    // if (_instancePtrs[i] != null) {
    //   throw StateError("Already exists instance with id $i");
    // }
    // _instancePtrs[i] = _gsapiInstancePtr;
    final response = NewInstanceResponse(i, result);
    return IsolateResponse(requestId, response);
  }
  if (request is! GsInstanceRequest) {
    throw UnsupportedError(
        "Unsupported message type: ${isolateRequest.runtimeType}");
  }
  const instanceId = 0;
  // final instanceId = request.instanceId;
  // final instancePtr = _instancePtrs[instanceId];
  // if (instancePtr == null) {
  //   throw StateError("No instance with id $instanceId");
  // }
  // final instance = instancePtr.value;
  // if (instance == nullptr) {
  //   throw StateError(
  //       "Reference to nullptr in instance with id $instanceId");
  // }
  // assert(instance != nullptr);
  switch (request) {
    case final SetArgEncodingRequest request:
      final encoding = request.encoding;
      final result = gsapi.gsdart_set_arg_encoding(encoding);
      // final result = _gsapi.set_arg_encoding(instance, encoding);
      final response = SetArgEncodingResponse(instanceId, result);
      return IsolateResponse(requestId, response);
    case final InitWithArgsRequest request:
      final arguments = request.arguments;
      final argc = arguments.length;
      final ffiStrings = arguments.map((str) => str.toNativeUtf8()).toList();
      final Pointer<Pointer<Char>> argv = malloc.call<Pointer<Char>>(argc);
      for (int i = 0; i < ffiStrings.length; i++) {
        argv[i] = ffiStrings[i].cast();
      }
      final result = gsapi.gsdart_init_with_args(argc, argv);
      final response = InitWithArgsResponse(instanceId, result);
      for (final ptr in ffiStrings) {
        malloc.free(ptr);
      }
      malloc.free(argv);
      return IsolateResponse(requestId, response);
    case ExitRequest():
      final result = gsapi.gsdart_exit();
      // final result = _gsapi.exit(instance);
      final response = ExitResponse(instanceId, result);
      return IsolateResponse(requestId, response);
    case DeleteInstanceRequest():
      gsapi.gsdart_delete_instance();
      // _gsapi.delete_instance(instance);
      final response = DeleteInstanceResponse(instanceId);
      // final pointer = _instancePtrs.remove(instanceId);
      // if (pointer != null) {
      //   malloc.free(pointer);
      // }
      return IsolateResponse(requestId, response);
  }
}
