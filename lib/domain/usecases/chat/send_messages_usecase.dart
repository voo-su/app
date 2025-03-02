import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class SendMessagesUseCase implements UseCase<bool, SendMessageParams> {
  final ChatRepository repository;

  SendMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SendMessageParams params) async {
    return await repository.sendMessage(params);
  }
}
