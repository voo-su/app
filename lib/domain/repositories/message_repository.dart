import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/message.dart';

abstract class MessageRepository {
  Future<Either<Failure, MessageResponse>> getHistory(MessageParams params);

  Future<Either<Failure, String>> sendMessage(SendMessageParams params);
}
