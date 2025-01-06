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

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<Failure, AuthLogin>> login(params) async {
    try {
      final response = await remoteDataSource.login(params.email, "android");

      localDataSource.setLogin(AuthLoginModel(
        expiresIn: response.expiresIn,
        token: response.token,
      ));

      return Right(AuthLogin(
        expiresIn: response.expiresIn,
        token: response.token,
      ));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, AuthVerify>> verify(params) async {
    try {
      final result = await localDataSource.getLogin();
      final response = await remoteDataSource.verify(params.code, result.token);

      localDataSource.setVerify(AuthVerifyModel(
        accessToken: response.accessToken,
        expiresIn: response.expiresIn,
        type: response.type,
      ));

      return Right(AuthVerify(
        accessToken: response.accessToken,
        expiresIn: response.expiresIn,
        type: response.type,
      ));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
