import 'dart:io';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:voo_su/generated/grpc_pb/upload.pb.dart';

abstract class UploadLocalDataSource {
  List<SaveFilePartRequest> readFileAndSplit(String path, int fileId);
}

class UploadLocalDataSourceImpl implements UploadLocalDataSource {
  static const int chunkSize = 512 * 1024;

  @override
  List<SaveFilePartRequest> readFileAndSplit(String path, int fileId) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception("Файл не найден");
    }

    final List<SaveFilePartRequest> parts = [];
    final reader = file.openSync();
    int partNumber = 0;
    while (true) {
      final bytes = reader.readSync(chunkSize);
      if (bytes.isEmpty) break;

      print('<< VLog - UploadLocalDataSourceImpl - readFileAndSplit - bytes $bytes >>');
      print('<< VLog - UploadLocalDataSourceImpl - readFileAndSplit - uint8 ${Uint8List.fromList(bytes)} >>');

      parts.add(
        SaveFilePartRequest(
          fileId: Int64(fileId),
          filePart: partNumber++,
          bytes: Uint8List.fromList(bytes),
        ),
      );
    }
    reader.close();

    return parts;
  }
}
