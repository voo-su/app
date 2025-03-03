import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';

abstract class AccountRepository {
  Future<Either<Failure, AccountResponse>> getAccount(AccountParams params);

  Future<Either<Failure, NotifySettings>> getNotifySettings(bool isGroup);

  Future<Either<Failure, String>> getFirebaseToken(String token);
}
