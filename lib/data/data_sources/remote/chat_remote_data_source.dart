import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';

class ChatRemoteDataSource {
  final ChatServiceClient client;

  ChatRemoteDataSource(this.client);

  Future<GetChatsResponse> list(String token) async {
    final request = GetChatsRequest();

    return await client.chats(
      request,
      options: CallOptions(
        metadata: {"Authorization": token},
      ),
    );
  }
}
