import 'package:equatable/equatable.dart';

class AuthLoginParams {
  final String email;

  const AuthLoginParams({
    required this.email,
  });
}

class AuthVerifyParams {
  final String code;

  const AuthVerifyParams({
    required this.code,
  });
}

class AuthLogin extends Equatable {
  final int expiresIn;
  final String token;

  const AuthLogin({
    required this.expiresIn,
    required this.token,
  });

  @override
  List<Object> get props => [expiresIn, token];
}

class AuthVerify extends Equatable {
  final String accessToken;
  final int expiresIn;
  final String type;

  const AuthVerify({
    required this.accessToken,
    required this.expiresIn,
    required this.type,
  });

  @override
  List<Object> get props => [accessToken, expiresIn, type];
}
