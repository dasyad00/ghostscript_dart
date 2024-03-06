sealed class GsRequest {
  const GsRequest();
}

class RevisionRequest extends GsRequest {
  const RevisionRequest();
}

sealed class GsInstanceRequest extends GsRequest {
  final int instanceId;
  const GsInstanceRequest(this.instanceId);
}

sealed class GsResponse {
  final int instanceId;
  final int returnCode;
  const GsResponse(this.instanceId, this.returnCode);
}

class NewInstanceRequest extends GsRequest {
  const NewInstanceRequest();
}

class NewInstanceResponse extends GsResponse {
  const NewInstanceResponse(super.instanceId, super.returnCode);
}

class SetArgEncodingRequest extends GsInstanceRequest {
  final int encoding;
  const SetArgEncodingRequest(super.instanceId, this.encoding);
}

class SetArgEncodingResponse extends GsResponse {
  const SetArgEncodingResponse(super.instanceId, super.returnCode);
}

class InitWithArgsRequest extends GsInstanceRequest {
  final List<String> arguments;
  const InitWithArgsRequest(super.instanceId, this.arguments);
}

class InitWithArgsResponse extends GsResponse {
  const InitWithArgsResponse(super.instanceId, super.returnCode);
}

class ExitRequest extends GsInstanceRequest {
  const ExitRequest(super.instanceId);
}

class ExitResponse extends GsResponse {
  const ExitResponse(super.instanceId, super.returnCode);
}

class DeleteInstanceRequest extends GsInstanceRequest {
  const DeleteInstanceRequest(super.instanceId);
}

class DeleteInstanceResponse extends GsResponse {
  DeleteInstanceResponse(int instanceId) : super(instanceId, 0);
}
