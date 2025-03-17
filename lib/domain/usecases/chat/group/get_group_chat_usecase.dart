import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pb.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class GetGroupChatUseCase implements UseCase<GetGroupChatResponse, int> {
  final GroupChatRepository repository;

  GetGroupChatUseCase(this.repository);

  @override
  Future<Either<Failure, GetGroupChatResponse>> call(int id) async {
    return await repository.getGroupChat(id);
  }
}
