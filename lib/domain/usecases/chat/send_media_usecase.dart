import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class SendMediaUseCase implements UseCase<bool, SendMediaParams> {
  final ChatRepository repository;

  SendMediaUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SendMediaParams params) {
    return repository.sendMedia(params);
  }
}
