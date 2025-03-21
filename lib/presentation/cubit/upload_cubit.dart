import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/utils/extension.dart';
import 'package:voo_su/domain/usecases/upload/upload_file_usecase.dart';

abstract class UploadState {}

class FileUploadInitial extends UploadState {}

class FileUploadInProgress extends UploadState {}

class FileUploadSuccess extends UploadState {}

class FileUploadFailure extends UploadState {
  final String error;

  FileUploadFailure(this.error);
}

class UploadCubit extends Cubit<UploadState> {
  final UploadFileUseCase _uploadFileUseCase;
  String? selectedPath;

  UploadCubit(this._uploadFileUseCase) : super(FileUploadInitial());

  List<File> getImageFiles() {
    final List<File> imageFiles = [];
    final Directory rootDir = Directory('/storage/emulated/0');

    void scanDirectory(Directory dir) {
      try {
        final entities = dir.listSync();
        for (var entity in entities) {
          if (entity is File && isImageFile(entity)) {
            imageFiles.add(entity);
          } else if (entity is Directory) {
            scanDirectory(entity);
          }
        }
      } catch (e) {
        print('<< VLog - TestUploadScreen - err $e >>');
      }
    }

    scanDirectory(rootDir);
    return imageFiles;
  }

  void selectFile(String path) {
    selectedPath = path;
    emit(FileUploadInitial());
  }

  Future<void> uploadFile() async {
    if (selectedPath == null) return;
    emit(FileUploadInProgress());
    try {
      final result = await _uploadFileUseCase(selectedPath!);
      result.fold(
        (failure) {
          print('<< VLog - UploadCubit - uploadFile - failure $failure >>');
          emit(FileUploadFailure(failure.toString()));
        },
        (success) {
          print('<< VLog - uploadFile - success $success (fileId) >>');
          emit(FileUploadSuccess());
        },
      );
    } catch (e) {
      emit(FileUploadFailure(e.toString()));
    }
  }
}
