import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/core/utils/extension.dart';
import 'package:voo_su/domain/entities/common.dart';
import 'package:voo_su/domain/usecases/upload/upload_file_usecase.dart';

enum UploadPurpose { chatMedia, groupPhoto, userAvatar }

abstract class UploadState {}

class FileUploadInitial extends UploadState {}

class FileUploadInProgress extends UploadState {}

class FileUploadSuccess extends UploadState {
  final InputFile uploadedFile;
  final UploadPurpose purpose;

  FileUploadSuccess(this.uploadedFile, this.purpose);
}

class FileUploadFailure extends UploadState {
  final String error;
  final UploadPurpose purpose;

  FileUploadFailure(this.error, this.purpose);
}

class UploadCubit extends Cubit<UploadState> {
  final UploadFileUseCase _uploadFileUseCase;

  String? _selectedPath;
  UploadPurpose? _purpose;

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
        print('<< VLog - UploadCubit - getImageFiles error: $e >>');
      }
    }

    scanDirectory(rootDir);
    return imageFiles;
  }

  void selectFile(String path, UploadPurpose purpose) {
    _selectedPath = path;
    _purpose = purpose;
    emit(FileUploadInitial());
  }

  Future<void> uploadFile() async {
    if (_selectedPath == null || _purpose == null) return;

    emit(FileUploadInProgress());

    try {
      final result = await _uploadFileUseCase(_selectedPath!);

      result.fold(
        (failure) {
          print('<< VLog - UploadCubit - uploadFile - failure: $failure >>');
          emit(FileUploadFailure(failure.toString(), _purpose!));
        },
        (success) {
          print('<< VLog - UploadCubit - uploadFile - success: $success >>');
          emit(FileUploadSuccess(success, _purpose!));
        },
      );
    } catch (e) {
      print('<< VLog - UploadCubit - uploadFile - exception: $e >>');
      emit(FileUploadFailure(e.toString(), _purpose!));
    }
  }
}
