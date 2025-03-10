import 'package:fixnum/fixnum.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';
import 'package:voo_su/domain/entities/message.dart';

class ChatRemoteDataSource {
  final ChatServiceClient client;

  ChatRemoteDataSource(this.client);

  Stream<Update> getUpdates() async* {
    try {
      yield* client.getUpdates(UpdatesRequest());
    } catch (e) {
      print('<< VLog - Error - ChatRemoteDataSource - getUpdates $e >>');
      rethrow;
    }
  }

  Future<GetChatsResponse> getChats() async {
    try {
      return await client.getChats(GetChatsRequest());
    } catch (e) {
      print('<< VLog - Error - ChatRemoteDataSource - getChats $e >>');
      rethrow;
    }
  }

  Future<GetHistoryResponse> getHistory(MessageParams params) async {
    await client.viewMessages(
      ViewMessagesRequest(
        receiver: Receiver(
          chatType: params.chatType,
          receiverId: Int64(params.receiverId),
        ),
        messageIds: [Int64(params.messageId)],
      ),
    );

    return await client.getHistory(
      GetHistoryRequest(
        receiver: Receiver(
          chatType: params.chatType,
          receiverId: Int64(params.receiverId),
        ),
        messageId: Int64(params.messageId),
        limit: Int64(params.limit),
      ),
    );
  }

  Future<SendMessageResponse> sendMessage(SendMessageParams params) async {
    return await client.sendMessage(
      SendMessageRequest(
        receiver: Receiver(
          chatType: params.chatType,
          receiverId: Int64(params.receiverId),
        ),
        message: params.message,
        replyToMsgId:
            params.replyToMsgId != null ? Int64(params.replyToMsgId!) : null,
      ),
    );
  }

  Future<DeleteMessagesResponse> deleteMessages(
    DeleteMessagesParams params,
  ) async {
    return await client.deleteMessages(
      DeleteMessagesRequest(
        receiver: Receiver(
          chatType: params.chatType,
          receiverId: Int64(params.receiverId),
        ),
        messageIds: params.messageIds.map((id) => Int64(id)).toList(),
        revoke: false,
      ),
    );
  }
}
