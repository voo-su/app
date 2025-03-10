import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/core/error/exceptions.dart';
import 'package:voo_su/domain/entities/auth.dart';

abstract class AuthLocalDataSource {
  Future<void> setLogin(AuthLogin login);

  Future<AuthLogin> getLogin();

  Future<void> setVerify(AuthVerify verify);

  Future<String> getToken();

  Future<void> clearAuthData();
}

const authToken = 'VOO_SU_AUTH_TOKEN';
const authExpires = 'VOO_SU_AUTH_EXPIRES';

const userToken = 'VOO_SU_TOKEN';
const userExpires = 'VOO_SU_EXPIRES';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.secureStorage,
  });

  @override
  Future<void> setLogin(AuthLogin login) async {
    try {
      await sharedPreferences.setString(authToken, login.token);
      await sharedPreferences.setInt(authExpires, login.expiresIn);
      // await secureStorage.write(key: authToken, value: login.token);
      // await secureStorage.write(key: authExpires, value: login.expiresIn);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<AuthLogin> getLogin() async {
    final token = sharedPreferences.getString(authToken);
    final expires = sharedPreferences.getInt(authExpires);
    //final token = await secureStorage.read(key: authToken);
    //final expires = await secureStorage.read(key: authExpires);
    if (token != null && expires != null) {
      return AuthLogin(token: token, expiresIn: expires);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setVerify(AuthVerify verify) async {
    try {
      sharedPreferences.setString(userToken, verify.accessToken);
      sharedPreferences.setInt(userExpires, verify.expiresIn);
      sharedPreferences.remove(authToken);
      sharedPreferences.remove(userExpires);
      //await secureStorage.write(key: userToken, value: verify.accessToken);
      //await secureStorage.write(key: userExpires, value: verify.expiresIn);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final token = sharedPreferences.getString(userToken);
      if (token == null) {
        throw CacheException();
      }
      return token;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      await sharedPreferences.clear();
      await secureStorage.deleteAll();
    } catch (e) {
      throw CacheException();
    }
  }
}
