import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/auth.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthLogin, AuthLoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthLogin>> call(AuthLoginParams params) async {
    return repository.login(params);
  }
}
