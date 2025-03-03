import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/utils.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';

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

  Future<GetNotifySettingsResponse> getNotifySettings(
    String token,
    NotifyEntity entity,
  ) async {
    try {
      final request = GetNotifySettingsRequest(entity: entity);
      final response = await client.getNotifySettings(
        request,
        options: createAuthOptions(token),
      );
      print("Ответ от сервера ${response.settings}");

      return response;
    } catch (e) {
      print("Ошибка при получении настроек уведомлений: $e");
      rethrow;
    }
  }

  Future<UpdateNotifySettingsResponse> updateNotifySettings(
    String token,
    NotifyEntity entity,
    EntityNotifySettings settings,
  ) async {
    final request = UpdateNotifySettingsRequest(
      entity: entity,
      settings: settings,
    );
    final response = await client.updateNotifySettings(
      request,
      options: createAuthOptions(token),
    );
    return response;
  }

  Future<bool> registerDevice(String token, String firebaseToken) async {
    final request = RegisterDeviceRequest(tokenType: 1, token: firebaseToken);

    try {
      final response = await client.registerDevice(
        request,
        options: createAuthOptions(token),
      );
      print("FCM-токен отправлен, ответ: ${response.success}");
      return response.success;
    } catch (e) {
      print("Ошибка при отправке FCM-токена: $e");
      rethrow;
    }
  }

  Future<bool> updateProfile(String token, UpdateProfileParams params) async {
    final request = UpdateProfileRequest(
      name: params.name,
      surname: params.surname,
      gender: params.gender,
      birthday: params.birthday,
      about: params.about,
    );

    print("reqiest $request");

    try {
      final response = await client.updateProfile(
        request,
        options: createAuthOptions(token),
      );
      return response.success;
    } catch (e) {
      print("Ошибка при обновлении профиля: $e");
      rethrow;
    }
  }
}
