import 'dart:async';

import 'package:ghostscript_dart/src/isolate_messages.dart';

import 'gs_iapi.dart';
import 'isolate.dart';
import 'models.dart';

class GhostscriptDart {
  final int _instanceId;

  GhostscriptDart._(this._instanceId);

  static Future<GsResponse> _compute(GsRequest request) async {
    final helperIsolateSendPort = await helperIsolateSendPortFuture;
    final requestId = isolateRequestId++;
    final completer = Completer<IsolateResponse>();
    isolateResponses[requestId] = completer;
    helperIsolateSendPort.send(IsolateRequest(requestId, request));
    final response = await completer.future;
    return response.response;
  }

  static Future<GhostscriptDart> newInstance() async {
    const request = NewInstanceRequest();
    final response = await _compute(request);
    return GhostscriptDart._(response.instanceId);
  }

  static GhostscriptRevision revision() {
    return gsapi_revision();
  }

  Future<int> setEncoding(int encoding) async {
    assert(encoding == GS_ARG_ENCODING_LOCAL ||
        encoding == GS_ARG_ENCODING_UTF16LE ||
        encoding == GS_ARG_ENCODING_UTF8);
    final request = SetArgEncodingRequest(_instanceId, encoding);
    final response = await _compute(request);
    return response.returnCode;
  }

  Future<int> initWithArgs(List<String> arguments) async {
    assert(arguments.isNotEmpty);
    assert(arguments.every((element) => element.isNotEmpty));
    final request = InitWithArgsRequest(_instanceId, arguments);
    final response = await _compute(request);
    return response.returnCode;
  }

  Future<int> _exit() async {
    final request = ExitRequest(_instanceId);
    final response = await _compute(request);
    return response.returnCode;
  }

  Future<int> _deleteInstance() async {
    final request = DeleteInstanceRequest(_instanceId);
    final response = await _compute(request);
    return response.returnCode;
  }

  Future<int> close() async {
    final code = await _exit();
    await _deleteInstance();
    return code;
  }
}