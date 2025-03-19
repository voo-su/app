import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class DeleteGroupUsecase implements UseCase<DeleteGroupChatResponse, int> {
  final GroupChatRepository repository;

  DeleteGroupUsecase(this.repository);

  @override
  Future<Either<Failure, DeleteGroupChatResponse>> call(int id) async {
    return await repository.deleteGroupChat(id);
  }
}
