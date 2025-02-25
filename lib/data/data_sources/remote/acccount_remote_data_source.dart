import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pbgrpc.dart';

class AccountRemoteDataSource {
  final AccountServiceClient client;

  AccountRemoteDataSource(this.client);

  Future<GetAccountResponse> get(String token) async {
    print("Запрос на сервер с токеном: $token");
    final request = GetAccountRequest();

    try {
      final response = await client.get(
        request,
        options: CallOptions(metadata: {"Authorization": token}),
      );
      print("ответ: $response");
      return response;
    } catch (e) {
      print("Ошибка при получении аккаунта: $e");
      rethrow;
    }
  }
}
