import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';

class GetAccountUsecase implements UseCase<AccountResponse, AccountParams> {
  final AccountRepository repository;

  GetAccountUsecase(this.repository);

  @override
  Future<Either<Failure, AccountResponse>> call(AccountParams params) async {
    return await repository.getAccount(params);
  }
}
