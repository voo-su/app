import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';

abstract class UploadRepository {
  Future<Either<Failure, int>> uploadFile(String path);
}
