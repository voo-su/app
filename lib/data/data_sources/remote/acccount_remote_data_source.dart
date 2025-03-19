import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';
import 'package:voo_su/generated/grpc_pb/account.pbgrpc.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';

class AccountRemoteDataSource {
  final AccountServiceClient client;

  AccountRemoteDataSource(this.client);

  Future<GetProfileResponse> get() async {
    try {
      return await client.getProfile(GetProfileRequest());
    } catch (e) {
      print("Ошибка при получении аккаунта: $e");
      rethrow;
    }
  }

  Future<GetNotifySettingsResponse> getNotifySettings(
    NotifyEntity entity,
  ) async {
    try {
      return await client.getNotifySettings(
        GetNotifySettingsRequest(entity: entity),
      );
    } catch (e) {
      print("Ошибка при получении настроек уведомлений: $e");
      rethrow;
    }
  }

  Future<UpdateNotifySettingsResponse> updateNotifySettings(
    NotifyEntity entity,
    EntityNotifySettings settings,
  ) async {
    final response = await client.updateNotifySettings(
      UpdateNotifySettingsRequest(entity: entity, settings: settings),
    );
    return response;
  }

  Future<bool> registerDevice(String firebaseToken) async {
    try {
      final response = await client.registerDevice(
        RegisterDeviceRequest(tokenType: 1, token: firebaseToken),
      );
      print("FCM-токен отправлен, ответ: ${response.success}");
      return response.success;
    } catch (e) {
      print("Ошибка при отправке FCM-токена: $e");
      rethrow;
    }
  }

  Future<bool> updateProfile(UpdateProfileParams params) async {
    try {
      final response = await client.updateProfile(
        UpdateProfileRequest(
          name: params.name,
          surname: params.surname,
          gender: params.gender,
          birthday: params.birthday,
          about: params.about,
        ),
      );
      return response.success;
    } catch (e) {
      print("Ошибка при обновлении профиля: $e");
      rethrow;
    }
  }
}
