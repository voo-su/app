import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/upload_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/upload_remote_data_source.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadLocalDataSource localDataSource;
  final UploadRemoteDataSource remoteDataSource;

  UploadRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<Failure, UploadedFile>> uploadFile(String path) async {
    try {
      final fileId = DateTime.now().millisecondsSinceEpoch;
      final chunks = localDataSource.readFileAndSplit(path, fileId);
      final fileName = path.split('/').last;
      print("test - $fileName $fileId $chunks");
      await remoteDataSource.uploadChunks(chunks);
      return Right(
        UploadedFile(id: fileId, parts: chunks.length, name: fileName),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
