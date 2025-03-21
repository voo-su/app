import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/repositories/upload_repository.dart';

class UploadFileUseCase implements UseCase<int, String> {
  final UploadRepository repository;

  UploadFileUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(String path) async {
    return await repository.uploadFile(path);
  }
}
