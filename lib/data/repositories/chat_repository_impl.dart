import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  ChatRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Stream<ChatUpdate>> getUpdates() async {
    print('<< VLog - ChatRepositoryImpl - getUpdates >>');

    return remoteDataSource.getUpdates().map((update) {
      print('<< VLog - ChatRepositoryImpl - getUpdates $update >>');
      if (update.hasNewMessage()) {
        return UpdateNewMessage(
          message: Message(
            id: update.newMessage.message.id.toInt(),
            chatType: update.newMessage.message.receiver.chatType,
            msgType: update.newMessage.message.msgType,
            receiverId: update.newMessage.message.receiver.receiverId.toInt(),
            userId: update.newMessage.message.userId.toInt(),
            content: update.newMessage.message.content,
            isRead: update.newMessage.message.isRead,
            createdAt: update.newMessage.message.createdAt,
          ),
        );
      } else if (update.hasChatReadInbox()) {
        return UpdateChatReadInbox(
          chatType: update.chatReadInbox.receiver.chatType.toInt(),
          receiverId: update.chatReadInbox.receiver.receiverId.toInt(),
          lastReadInboxMessageId: update.chatReadInbox.lastReadInboxMessageId,
          unreadCount: update.chatReadInbox.unreadCount.toInt(),
        );
      } else if (update.hasUserTyping()) {
        return UpdateUserTyping(
          chatType: update.userTyping.receiver.chatType.toInt(),
          receiverId: update.userTyping.receiver.receiverId.toInt(),
          userId: update.userTyping.userId.toInt(),
          isTyping: update.userTyping.isTyping,
        );
      }
      throw Exception("Неизвестно");
    });
  }

  @override
  Future<Either<Failure, ChatResponse>> getChats(params) async {
    try {
      final response = await remoteDataSource.getChats();

      return Right(
        ChatResponse(
          chats: List.of(
            response.items.map(
              (item) => Chat(
                id: item.id.toInt(),
                chatType: item.receiver.chatType,
                receiverId: item.receiver.receiverId.toInt(),
                username: item.username,
                avatar: item.avatar,
                name: item.name,
                surname: item.surname,
                msgText: item.msgText,
                unreadCount: item.unreadCount.toInt(),
                updatedAt: item.updatedAt,
                isOnline: item.isOnline,
                isDisturb: item.isDisturb,
                isBot: item.isBot,
              ),
            ),
          ),
        ),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> getHistory(params) async {
    try {
      final response = await remoteDataSource.getHistory(params);

      return Right(
        MessageResponse(
          messages: List.of(
            response.items.map(
              (item) => Message(
                id: item.id.toInt(),
                chatType: item.receiver.chatType,
                receiverId: item.receiver.receiverId.toInt(),
                userId: item.userId.toInt(),
                msgType: item.msgType,
                content: item.content,
                isRead: item.isRead,
                createdAt: item.createdAt,
              ),
            ),
          ),
        ),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> sendMessage(params) async {
    try {
      final response = await remoteDataSource.sendMessage(params);
      return Right(response.success);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMessages(
    DeleteMessagesParams params,
  ) async {
    try {
      final response = await remoteDataSource.deleteMessages(params);

      return Right(response.success);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
