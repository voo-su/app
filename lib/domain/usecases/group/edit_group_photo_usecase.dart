import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class EditGroupPhotoUseCase {
  final GroupChatRepository repository;

  EditGroupPhotoUseCase(this.repository);

  Future<Either<Failure, bool>> call(EditGroupPhotoParams params) {
    return repository.editGroupPhoto(params);
  }
}
