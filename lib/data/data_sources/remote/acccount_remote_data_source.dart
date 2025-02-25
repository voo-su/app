import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';

class AccountRemoteDataSource {
  final AccountServiceClient client;

  AccountRemoteDataSource(this.client);

  Future<GetProfileResponse> get(String token) async {
    print("Запрос на сервер с токеном: $token");
    final request = GetProfileRequest();

    try {
      final response = await client.getProfile(
        request,
        options: createAuthOptions(token),
      );
      print("ответ: $response");
      return response;
    } catch (e) {
      print("Ошибка при получении аккаунта: $e");
      rethrow;
    }
  }
}
