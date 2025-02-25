import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatResponse>> getChats(ChatParams params);

  Future<Either<Failure, MessageResponse>> getHistory(MessageParams params);

  Future<Either<Failure, String>> sendMessage(SendMessageParams params);
}
