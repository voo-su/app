import 'package:fixnum/fixnum.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/generated/grpc_pb/chat.pbgrpc.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart' as common;

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
          chatType: params.receiver.chatType,
          receiverId: Int64(params.receiver.receiverId),
        ),
        messageIds: [Int64(params.messageId)],
      ),
    );

    return await client.getHistory(
      GetHistoryRequest(
        receiver: Receiver(
          chatType: params.receiver.chatType,
          receiverId: Int64(params.receiver.receiverId),
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
          chatType: params.receiver.chatType,
          receiverId: Int64(params.receiver.receiverId),
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
          chatType: params.receiver.chatType,
          receiverId: Int64(params.receiver.receiverId),
        ),
        messageIds: params.messageIds.map((id) => Int64(id)).toList(),
        revoke: false,
      ),
    );
  }

  Future<SendMediaResponse> sendMedia(SendMediaParams params) async {
    dynamic attribute;
    InputMedia media;
    if (params.media.fileType == 'photo') {
      media = InputMedia(
        photo: InputMediaUploadedPhoto(
          file: common.InputFile(
            id: Int64(params.file.id),
            parts: params.file.parts,
            name: params.file.name,
          ),
        ),
      );
    } else {
      if (params.media.fileType == 'video') {
        attribute = common.DocumentAttributeVideo(
          duration: params.media.duration ?? 0,
          width: params.media.width ?? 0,
          height: params.media.height ?? 0,
        );
      } else if (params.media.fileType == 'audio') {
        attribute = common.DocumentAttributeAudio(
          duration: params.media.duration ?? 0,
          name: params.media.fileName,
        );
      } else {
        attribute = common.DocumentAttributeFilename(fileName: params.media.fileName);
      }

      media = InputMedia(
        document: InputMediaUploadedDocument(
          file: common.InputFile(
            id: Int64(params.file.id),
            parts: params.file.parts,
            name: params.file.name,
          ),
          mimeType: params.media.mimeType,
          attributes: attribute,
        ),
      );
    }

    return await client.sendMedia(
      SendMediaRequest(
        receiver: Receiver(
          chatType: params.receiver.chatType,
          receiverId: Int64(params.receiver.receiverId),
        ),
        media: media,
        message: params.message ?? '',
        replyToMsgId:
            params.replyToMsgId != null ? Int64(params.replyToMsgId!) : null,
      ),
    );
  }
}
