import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/domain/entities/auth/login.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Login>> login(params) async {
    try {
      final response = await remoteDataSource.login(params.email, "android");
      return Right(Login(expiresIn: response.expiresIn, token: response.token));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Verify>> verify(params) async {
    try {

      // TODO
      final response = await remoteDataSource.verify(params.code, "");
      return Right(Verify(
        accessToken: response.accessToken,
        expiresIn: response.expiresIn,
        type: response.type,
      ));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
