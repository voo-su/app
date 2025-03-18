import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class GetMembersUseCase implements UseCase<GetMembersResponse, int> {
  final GroupChatRepository repository;

  GetMembersUseCase(this.repository);

  @override
  Future<Either<Failure, GetMembersResponse>> call(int groupId) async {
    return await repository.getMembers(groupId);
  }
}
