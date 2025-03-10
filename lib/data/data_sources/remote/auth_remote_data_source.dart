import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';

class AuthRemoteDataSource {
  final AuthServiceClient client;

  AuthRemoteDataSource(this.client);

  Future<AuthLoginResponse> login(String email, String platform) async {
    return await client.login(
      AuthLoginRequest(email: email, platform: platform),
    );
  }

  Future<AuthVerifyResponse> verify(String token, String code) async {
    return await client.verify(AuthVerifyRequest(code: code, token: token));
  }

  Future<AuthLogoutResponse> logout() async {
    return await client.logout(AuthLogoutRequest());
  }
}
