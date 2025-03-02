import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class DeleteMessagesUseCase extends UseCase<bool, DeleteMessagesParams> {
  final ChatRepository repository;

  DeleteMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(DeleteMessagesParams params) {
    return repository.deleteMessages(params);
  }
}
