import 'package:voo_su/generated/grpc_pb/contact.pbgrpc.dart';

class ContactRemoteDataSource {
  final ContactServiceClient client;

  ContactRemoteDataSource(this.client);

  Future<GetContactsResponse> getContacts() async {
    return await client.getContacts(GetContactsRequest());
  }

  Future<GetUserResponse> getUser(int uid) async {
    return await client.getUser(GetUserRequest());
  }

  Future<SearchResponse> search(int uid) async {
    return await client.search(SearchRequest());
  }
}
