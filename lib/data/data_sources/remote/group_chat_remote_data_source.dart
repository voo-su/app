import 'package:fixnum/fixnum.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pbgrpc.dart';

class GroupChatRemoteDataSource {
  final GroupChatServiceClient client;

  GroupChatRemoteDataSource(this.client);

  Future<GetGroupChatResponse> getGroupChat(String token, int id) async {
    return await client.getGroupChat(GetGroupChatRequest());
  }

  Future<GetMembersResponse> getMembers(String token, int id) async {
    return await client.getMembers(GetMembersRequest(id: Int64(id)));
  }
}
