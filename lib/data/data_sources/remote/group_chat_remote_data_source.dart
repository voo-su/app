import 'package:fixnum/fixnum.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';

class GroupChatRemoteDataSource {
  final GroupChatServiceClient client;

  GroupChatRemoteDataSource(this.client);

  Future<GetGroupChatResponse> getGroupChat(String token, int id) async {
    //
    final request = GetGroupChatRequest();

    return await client.getGroupChat(
      request,
      options: createAuthOptions(token),
    );
  }

  Future<GetMembersResponse> getMembers(String token, int id) async {
    final request = GetMembersRequest(id: Int64(id));

    return await client.getMembers(request, options: createAuthOptions(token));
  }
}
