import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat.dart';

abstract class GroupChatRepository {
  Future<Either<Failure, GroupChat>> getGroupChat(int id);
}
