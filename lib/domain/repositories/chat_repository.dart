import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatResponse>> getChats(FilterChatParams params);
}
