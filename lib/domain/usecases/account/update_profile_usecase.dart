import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';

class UpdateProfileUseCase {
  final AccountRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, bool>> call(UpdateProfileParams params) {
    return repository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String name;
  final String surname;
  final int gender;
  final String birthday;
  final String about;

  UpdateProfileParams({
    required this.name,
    required this.surname,
    required this.gender,
    required this.birthday,
    required this.about,
  });
}
