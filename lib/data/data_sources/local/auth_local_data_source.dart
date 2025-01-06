import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/core/error/exceptions.dart';
import 'package:voo_su/data/models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<void> setLogin(AuthLoginModel login);

  Future<AuthLoginModel> getLogin();

  Future<void> setVerify(AuthVerifyModel verify);

  Future<AuthVerifyModel> getVerify();

  Future<String> getToken();
}

const authLoginKey = 'VOO_SU_AUTH_LOGIN';
const authKey = 'VOO_SU_AUTH';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<void> setLogin(AuthLoginModel login) {
    return sharedPreferences.setString(authLoginKey, loginModelToJson(login));
  }

  @override
  Future<AuthLoginModel> getLogin() async {
    if (sharedPreferences.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }

    final jsonString = sharedPreferences.getString(authLoginKey);
    if (jsonString != null) {
      return Future.value(loginModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setVerify(AuthVerifyModel verify) {
    return sharedPreferences.setString(authKey, verifyModelToJson(verify));
  }

  @override
  Future<AuthVerifyModel> getVerify() async {
    if (sharedPreferences.getBool('first_run') ?? true) {
      await secureStorage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }

    final jsonString = sharedPreferences.getString(authKey);
    if (jsonString != null) {
      return Future.value(verifyModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> getToken() async {
    String? token = await secureStorage.read(key: authKey);
    if (token != null) {
      return Future.value(token);
    } else {
      throw CacheException();
    }
  }
}
