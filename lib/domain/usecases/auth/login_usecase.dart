import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/auth/login.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<Login, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return repository.login(params);
  }
}
