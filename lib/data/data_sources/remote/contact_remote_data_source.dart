import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/contact.pbgrpc.dart';

class ContactRemoteDataSource {
  final ContactServiceClient client;

  ContactRemoteDataSource(this.client);

  Future<GetContactListResponse> list(String token) async {
    final request = GetContactListRequest();

    return await client.list(
      request,
      options: CallOptions(metadata: {"Authorization": token}),
    );
  }
}
