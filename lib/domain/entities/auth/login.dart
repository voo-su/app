import 'package:equatable/equatable.dart';

class LoginParams {
  final String email;

  const LoginParams({
    required this.email,
  });
}

class VerifyParams {
  final String code;

  const VerifyParams({
    required this.code,
  });
}

class Login extends Equatable {
  final int expiresIn;
  final String token;

  const Login({
    required this.expiresIn,
    required this.token,
  });

  @override
  List<Object> get props => [expiresIn, token];
}

class Verify extends Equatable {
  final String accessToken;
  final int expiresIn;
  final String type;

  const Verify({
    required this.accessToken,
    required this.expiresIn,
    required this.type,
  });

  @override
  List<Object> get props => [accessToken, expiresIn, type];
}
