import 'package:fixnum/fixnum.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';
import 'package:voo_su/domain/entities/message.dart';

class ChatRemoteDataSource {
  final ChatServiceClient client;

  ChatRemoteDataSource(this.client);

  Future<GetChatsResponse> getChats(String token) async {
    final request = GetChatsRequest();

    return await client.getChats(request, options: createAuthOptions(token));
  }

  Future<GetHistoryResponse> getHistory(
    String token,
    MessageParams params,
  ) async {
    final request = GetHistoryRequest(
      receiver: Receiver(
        chatType: params.chatType,
        receiverId: Int64(params.receiverId),
      ),
      recordId: Int64(params.recordId),
      limit: Int64(params.limit),
    );

    return await client.getHistory(request, options: createAuthOptions(token));
  }

  Future<SendMessageResponse> sendMessage(
    String token,
    SendMessageParams params,
  ) async {
    final request = SendMessageRequest(
      receiver: Receiver(
        chatType: params.chatType,
        receiverId: Int64(params.receiverId),
      ),
      message: params.message,
    );

    return await client.sendMessage(request, options: createAuthOptions(token));
  }
}
