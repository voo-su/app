import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/contact.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';

class ContactRemoteDataSource {
  final ContactServiceClient client;

  ContactRemoteDataSource(this.client);

  Future<GetContactsResponse> getContacts(String token) async {
    final request = GetContactsRequest();

    return await client.getContacts(request, options: createAuthOptions(token));
  }

  Future<GetUserResponse> getUser(String token, int uid) async {
    final request = GetUserRequest();

    return await client.getUser(request, options: createAuthOptions(token));
  }

  Future<SearchResponse> search(String token, int uid) async {
    final request = SearchRequest();

    return await client.search(request, options: createAuthOptions(token));
  }
}
