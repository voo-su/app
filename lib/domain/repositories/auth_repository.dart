import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthLogin>> login(AuthLoginParams params);

  Future<Either<Failure, AuthVerify>> verify(AuthVerifyParams params);
}
