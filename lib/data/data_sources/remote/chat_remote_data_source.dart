import 'package:fixnum/fixnum.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';
import 'package:voo_su/domain/entities/message.dart';

class ChatRemoteDataSource {
  final ChatServiceClient client;

  ChatRemoteDataSource(this.client);

  Stream<Update> getUpdates(String token) async* {
    try {
      final request = UpdatesRequest();
      yield* client.getUpdates(request, options: createAuthOptions(token));
    } catch (e) {
      print('<< VLog - Error - ChatRemoteDataSource - getUpdates $e >>');
      rethrow;
    }
  }

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
      messageId: Int64(params.messageId),
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

  Future<DeleteMessagesResponse> deleteMessages(
    String token,
    DeleteMessagesParams params,
  ) async {
    final request = DeleteMessagesRequest(
      receiver: Receiver(
        chatType: params.chatType,
        receiverId: Int64(params.receiverId),
      ),
      messageIds: params.messageIds.map((id) => Int64(id)).toList(),
      revoke: false,
    );

    print("request $request");

    return await client.deleteMessages(
      request,
      options: createAuthOptions(token),
    );
  }
}
