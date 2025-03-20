import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class EditGroupDescriptionUseCase
    implements UseCase<EditAboutGroupChatResponse, EditGroupDescriptionParams> {
  final GroupChatRepository repository;

  EditGroupDescriptionUseCase(this.repository);

  @override
  Future<Either<Failure, EditAboutGroupChatResponse>> call(
    EditGroupDescriptionParams params,
  ) async {
    return await repository.editGroupDescription(params);
  }
}
