import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';


class GetGroupChatUseCase implements UseCase<GroupChat, int> {
  final GroupChatRepository repository;

  GetGroupChatUseCase(this.repository);

  @override
  Future<Either<Failure, GroupChat>> call(int id) async {
    return await repository.getGroupChat(id);
  }
}
