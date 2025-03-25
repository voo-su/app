import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/common.dart';

abstract class UploadRepository {
  Future<Either<Failure, InputFile>> uploadFile(String path);
}
