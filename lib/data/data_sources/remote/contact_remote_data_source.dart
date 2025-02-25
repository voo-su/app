import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/contact.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';

class ContactRemoteDataSource {
  final ContactServiceClient client;

  ContactRemoteDataSource(this.client);

  Future<GetContactListResponse> list(String token) async {
    final request = GetContactListRequest();

    return await client.list(request, options: createAuthOptions(token));
  }
}
