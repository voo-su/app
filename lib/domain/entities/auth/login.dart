import 'package:equatable/equatable.dart';

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

class LoginParams {
  final String email;

  const LoginParams({
    required this.email,
  });
}
