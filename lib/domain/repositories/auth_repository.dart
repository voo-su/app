import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthLogin>> login(String email);

  Future<Either<Failure, AuthVerify>> verify(String code);

  Future<Either<Failure, void>> logout();
}
