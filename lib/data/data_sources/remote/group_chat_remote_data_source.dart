import 'package:fixnum/fixnum.dart';
import 'package:voo_su/generated/grpc_pb/group_chat.pbgrpc.dart';
import 'package:voo_su/domain/entities/chat.dart';

class GroupChatRemoteDataSource {
  final GroupChatServiceClient client;

  GroupChatRemoteDataSource(this.client);

  Future<CreateGroupChatResponse> createGroupChat(
    CreateGroupChatParams params,
  ) async {
    return await client.createGroupChat(
      CreateGroupChatRequest(name: params.name),
    );
  }

  Future<GetGroupChatResponse> getGroupChat(int id) async {
    return await client.getGroupChat(GetGroupChatRequest(id: Int64(id)));
  }

  Future<GetMembersResponse> getMembers(String token, int id) async {
    return await client.getMembers(GetMembersRequest(id: Int64(id)));
  }

  Future<AddUserToGroupChatResponse> addUserToGroupChat(
    AddUserParams params,
  ) async {
    return await client.addUserToGroupChat(
      AddUserToGroupChatRequest(
        id: Int64(params.id),
        userIds: params.userIds.map((e) => Int64(e)).toList(),
      ),
    );
  }

  Future<RemoveUserFromGroupChatResponse> removeUserFromGroupChat(
    RemoveUserParams params,
  ) async {
    return await client.removeUserFromGroupChat(
      RemoveUserFromGroupChatRequest(
        id: Int64(params.id),
        userId: Int64(params.userId),
      ),
    );
  }

  Future<LeaveGroupChatResponse> leaveGroupChat(int id) async {
    return await client.leaveGroupChat(LeaveGroupChatRequest(id: Int64(id)));
  }

  Future<DeleteGroupChatResponse> deleteGroupChat(int id) async {
    return await client.deleteGroupChat(DeleteGroupChatRequest(id: Int64(id)));
  }
}
