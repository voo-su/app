import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/account.dart';

abstract class AccountRepository {
  Future<Either<Failure, AccountResponse>> getAccount(AccountParams params);

  Future<Either<Failure, String>> getFirebaseToken(String token);
}
