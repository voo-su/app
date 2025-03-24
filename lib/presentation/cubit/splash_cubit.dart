import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/domain/usecases/account/get_firebase_token_usecase.dart';
import 'package:voo_su/presentation/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterSecureStorage _secureStorage;
  final GetFirebaseTokenUseCase _getFirebaseTokenUseCase;

  SplashCubit({
    required FirebaseMessaging firebaseMessaging,
    required FlutterSecureStorage secureStorage,
    required GetFirebaseTokenUseCase getFirebaseTokenUseCase,
  }) : _firebaseMessaging = firebaseMessaging,
       _secureStorage = secureStorage,
       _getFirebaseTokenUseCase = getFirebaseTokenUseCase,
       super(SplashInitial());

  Future<void> initialize() async {
    await _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    String? token = await _secureStorage.read(key: userToken);
    await Future.delayed(const Duration(seconds: 2));
    if (token != null && token.isNotEmpty) {
      _firebaseMessaging.requestPermission();

      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        _sendFirebaseToken(token);
      }

      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }

  void _sendFirebaseToken(String token) {
    _getFirebaseTokenUseCase(token).then((result) {
      result.fold(
        (failure) => print('<< VLog - Ошибка push токена >>'),
        (success) => print('<< VLog - FCM Token >>'),
      );
    });
  }
}
