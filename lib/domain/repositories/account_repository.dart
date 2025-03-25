import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/generated/grpc_pb/account.pb.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';

abstract class AccountRepository {
  Future<Either<Failure, AccountResponse>> getAccount(AccountParams params);

  Future<Either<Failure, NotifySettings>> getNotifySettings(
    NotifyEntity entity,
  );

  Future<Either<Failure, bool>> updateNotifySettings(
    UpdateNotifySettings notifySettings,
  );

  Future<Either<Failure, String>> getFirebaseToken(String token);

  Future<Either<Failure, bool>> updateProfile(UpdateProfileParams params);

  Future<Either<Failure, bool>> updateProfilePhoto(InputFile file);
}
