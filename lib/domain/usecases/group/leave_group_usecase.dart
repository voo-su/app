import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class LeaveGroupUsecase
    implements UseCase<LeaveGroupChatResponse, int> {
  final GroupChatRepository repository;

  LeaveGroupUsecase(this.repository);

  @override
  Future<Either<Failure, LeaveGroupChatResponse>> call(
    int id,
  ) async {
    return await repository.leaveGroupChat(id);
  }
}
