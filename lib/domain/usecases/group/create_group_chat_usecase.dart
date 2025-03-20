import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';

class CreateGroupChatUseCase {
  final GroupChatRepository repository;

  CreateGroupChatUseCase(this.repository);

  Future<Either<Failure, CreateGroupChatResponse>> call(
    CreateGroupChatParams params,
  ) {
    return repository.createGroupChat(params);
  }
}
