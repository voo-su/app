import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/acccount_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pb.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AccountRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, AccountResponse>> getAccount(
    AccountParams params,
  ) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.get(token);

      final account = Account(
        id: response.id.toInt(),
        avatar: response.avatar,
        username: response.username,
        email: response.email,
        name: response.name,
        surname: response.surname,
        gender: response.gender,
        birthday: response.birthday,
        about: response.about,
      );

      return Right(AccountResponse(account: account));
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, NotifySettings>> getNotifySettings(
    NotifyEntity entity,
  ) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.getNotifySettings(token, entity);

      final settings = NotifySettings(
        muteUntil: response.settings.muteUntil,
        silent: response.settings.silent,
        showPreviews: response.settings.showPreviews,
      );

      return Right(settings);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateNotifySettings(
    UpdateNotifySettings notifySettings,
  ) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.updateNotifySettings(
        token,
        notifySettings.entity,
        notifySettings.settings,
      );

      return Right(response.success);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getFirebaseToken(String firebaseToken) async {
    try {
      final String token = await localDataSource.getToken();
      final bool success = await remoteDataSource.registerDevice(
        token,
        firebaseToken,
      );

      if (success) {
        print("FCM-токен зарегистрирован");
        return Right("FCM-токен зарегистрирован");
      } else {
        print("FCM-токен нет");
        return Left(ExceptionFailure());
      }
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile(
    UpdateProfileParams params,
  ) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.updateProfile(token, params);
      return Right(response);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }
}
