import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';

class AuthRemoteDataSource {
  final AuthServiceClient client;

  AuthRemoteDataSource(this.client);

  Future<AuthLoginResponse> login(String email, String platform) async {
    final request = AuthLoginRequest(
      email: email,
      platform: platform,
    );

    return await client.login(request);
  }
}
