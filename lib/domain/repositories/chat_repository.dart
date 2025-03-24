import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Stream<ChatUpdate>> getUpdates();

  Future<Either<Failure, ChatResponse>> getChats(ChatParams params);

  Future<Either<Failure, MessageResponse>> getHistory(MessageParams params);

  Future<Either<Failure, bool>> sendMessage(SendMessageParams params);

  Future<Either<Failure, bool>> deleteMessages(DeleteMessagesParams params);

  Future<Either<Failure, bool>> sendMedia(SendMediaParams params);
}
