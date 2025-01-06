import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/auth/login.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class VerifyUseCase implements UseCase<Verify, VerifyParams> {
  final AuthRepository repository;

  VerifyUseCase(this.repository);

  @override
  Future<Either<Failure, Verify>> call(VerifyParams params) async {
    return await repository.verify(params);
  }
}
