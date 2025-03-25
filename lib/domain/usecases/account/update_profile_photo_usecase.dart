import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';

class UpdateProfilePhotoUseCase {
  final AccountRepository repository;

  UpdateProfilePhotoUseCase(this.repository);

  Future<Either<Failure, bool>> call(InputFile file) {
    return repository.updateProfilePhoto(file);
  }
}
