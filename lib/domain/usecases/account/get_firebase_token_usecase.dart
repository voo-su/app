import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';

class GetFirebaseTokenUseCase implements UseCase<String, String> {
  final AccountRepository repository;

  GetFirebaseTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(String firebaseToken) async {
    return await repository.getFirebaseToken(firebaseToken);
  }
}