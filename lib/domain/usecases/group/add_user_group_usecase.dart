import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class AddUserGroupUsecase
    implements UseCase<AddUserToGroupChatResponse, AddUserParams> {
  final GroupChatRepository repository;

  AddUserGroupUsecase(this.repository);

  @override
  Future<Either<Failure, AddUserToGroupChatResponse>> call(
    AddUserParams params,
  ) async {
    return await repository.addUserToGroupChat(params);
  }
}
