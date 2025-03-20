import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pb.dart';

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
  Future<Either<Failure, DeleteGroupChatResponse>> deleteGroupChat(int id);
  Future<Either<Failure, EditNameGroupChatResponse>> editGroupName(
    EditGroupNameParams params,
  );
  Future<Either<Failure, EditAboutGroupChatResponse>> editGroupDescription(
    EditGroupDescriptionParams params,
  );
}
