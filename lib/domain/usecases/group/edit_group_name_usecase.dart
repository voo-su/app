import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class EditGroupNameUseCase
    implements UseCase<EditNameGroupChatResponse, EditGroupNameParams> {
  final GroupChatRepository repository;

  EditGroupNameUseCase(this.repository);

  @override
  Future<Either<Failure, EditNameGroupChatResponse>> call(
    EditGroupNameParams params,
  ) async {
    return await repository.editGroupName(params);
  }
}
