import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/core/error/exceptions.dart';
import 'package:voo_su/data/models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<void> setLogin(AuthLoginModel login);

  Future<AuthLoginModel> getLogin();

  Future<void> setVerify(AuthVerifyModel verify);

  Future<AuthVerifyModel> getAuth();

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
  Future<void> setLogin(AuthLoginModel login) async {
    try {
      sharedPreferences.setString(authLoginKey, loginModelToJson(login));
      //await secureStorage.write(key: authLoginKey, value: loginModelToJson(login));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<AuthLoginModel> getLogin() async {
    final jsonString = sharedPreferences.getString(authLoginKey);
    //final jsonString = await secureStorage.read(key: authLoginKey);
    if (jsonString != null) {
      return Future.value(loginModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setVerify(AuthVerifyModel verify) async {
    try {
      sharedPreferences.setString(authKey, verifyModelToJson(verify));
      sharedPreferences.remove(authLoginKey);
      //await secureStorage.write(key: authKey, value: verifyModelToJson(verify));
      //await secureStorage.write(key: authLoginKey, value: verifyModelToJson(verify));
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<AuthVerifyModel> getAuth() async {
    final jsonString = sharedPreferences.getString(authKey);
    //final jsonString = await secureStorage.read(key: authKey);
    if (jsonString != null) {
      return Future.value(verifyModelFromJson(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> getToken() async {
    String? jsonString = sharedPreferences.getString(authKey);
    //String? jsonString = await secureStorage.read(key: authKey);
    if (jsonString != null) {
      final token = verifyModelFromJson(jsonString);
      return Future.value(token.accessToken);
    } else {
      throw CacheException();
    }
  }
}
