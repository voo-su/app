import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';

class AuthRemoteDataSource {
  final AuthServiceClient client;

  AuthRemoteDataSource(this.client);

  Future<AuthLoginResponse> login(String email, String platform) async {
    final request = AuthLoginRequest(email: email, platform: platform);

    return await client.login(request);
  }

  Future<AuthVerifyResponse> verify(String token, String code) async {
    final request = AuthVerifyRequest(code: code, token: token);

    return await client.verify(request);
  }

  Future<AuthLogoutResponse> logout(String token) async {
    final request = AuthLogoutRequest();
    return await client.logout(request, options: createAuthOptions(token));
  }
}
