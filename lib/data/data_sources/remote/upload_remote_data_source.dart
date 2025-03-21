import 'package:voo_su/generated/grpc_pb/upload.pbgrpc.dart';

class UploadRemoteDataSource {
  final UploadServiceClient client;

  UploadRemoteDataSource(this.client);

  Future<void> uploadChunks(List<SaveFilePartRequest> chunks) async {
    for (final chunk in chunks) {
      final response = await client.saveFilePart(chunk);
      if (!response.success) {
        throw Exception();
      }
    }
  }
}
