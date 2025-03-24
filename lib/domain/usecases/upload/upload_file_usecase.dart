import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/repositories/upload_repository.dart';


class UploadFileUseCase implements UseCase<UploadedFile, String> {
  final UploadRepository repository;

  UploadFileUseCase(this.repository);

  @override
  Future<Either<Failure, UploadedFile>> call(String path) async {
    return await repository.uploadFile(path);
  }
}
