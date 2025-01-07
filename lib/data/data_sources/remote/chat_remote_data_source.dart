import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';

class ChatRemoteDataSource {
  final ChatServiceClient client;

  ChatRemoteDataSource(this.client);

  Future<GetChatListResponse> list(String token) async {
    final request = GetChatListRequest();

    return await client.list(
      request,
      options: CallOptions(
        metadata: {"Authorization": token},
      ),
    );
  }
}
