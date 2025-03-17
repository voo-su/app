import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pb.dart';
import 'package:voo_su/domain/entities/chat.dart';

abstract class GroupChatRepository {
  Future<Either<Failure, CreateGroupChatResponse>> createGroupChat(
    CreateGroupChatParams params,
  );
  Future<Either<Failure, GetGroupChatResponse>> getGroupChat(int id);
  Future<Either<Failure, GetMembersResponse>> getMembers(int id);
  Future<Either<Failure, AddUserToGroupChatResponse>> addUserToGroupChat(
    AddUserParams params,
  );
  Future<Either<Failure, RemoveUserFromGroupChatResponse>>
  removeUserFromGroupChat(RemoveUserParams params);
  Future<Either<Failure, LeaveGroupChatResponse>> leaveGroupChat(int id);
}
