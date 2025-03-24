import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/chat_update.dart';

abstract class UploadRepository {
  Future<Either<Failure, UploadedFile>> uploadFile(String path);
}
