import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/data/models/auth_model.dart';
import 'package:voo_su/domain/entities/auth.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, AuthLogin>> login(email) async {
    print(1);
    try {
      final response = await remoteDataSource.login(email, "android");

      localDataSource.setLogin(
        AuthLoginModel(
          expiresIn: response.expiresIn.toInt(),
          token: response.token,
        ),
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
        AuthVerifyModel(
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
  Future<Either> logout() async {
    try {
      final result = await localDataSource.getLogin();
      final response = await remoteDataSource.logout(result.token);

      // TODO DELETE

      return Right(nil());
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
