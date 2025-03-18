import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class RemoveUserGroupUsecase
    implements UseCase<RemoveUserFromGroupChatResponse, RemoveUserParams> {
  final GroupChatRepository repository;

  RemoveUserGroupUsecase(this.repository);

  @override
  Future<Either<Failure, RemoveUserFromGroupChatResponse>> call(
    RemoveUserParams params,
  ) async {
    return await repository.removeUserFromGroupChat(params);
  }
}
