import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/auth.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class VerifyUseCase implements UseCase<AuthVerify, AuthVerifyParams> {
  final AuthRepository repository;

  VerifyUseCase(this.repository);

  @override
  Future<Either<Failure, AuthVerify>> call(AuthVerifyParams params) async {
    return await repository.verify(params);
  }
}
