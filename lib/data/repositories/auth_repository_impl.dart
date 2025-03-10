import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/domain/entities/auth.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, AuthLogin>> login(email) async {
    try {
      final response = await remoteDataSource.login(email, "android");

      localDataSource.setLogin(
        AuthLogin(expiresIn: response.expiresIn.toInt(), token: response.token),
      );

      return Right(
        AuthLogin(expiresIn: response.expiresIn.toInt(), token: response.token),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, AuthVerify>> verify(code) async {
    try {
      final result = await localDataSource.getLogin();
      final response = await remoteDataSource.verify(result.token, code);

      localDataSource.setVerify(
        AuthVerify(
          accessToken: response.accessToken,
          expiresIn: response.expiresIn.toInt(),
          type: response.type,
        ),
      );

      return Right(
        AuthVerify(
          accessToken: response.accessToken,
          expiresIn: response.expiresIn.toInt(),
          type: response.type,
        ),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.clearAuthData();

      return const Right(null);
    } catch (failure) {
      print("Ошибка при logout: $failure");
      return Left(ExceptionFailure());
    }
  }
}
