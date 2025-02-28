import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class SendMessagesUsecase implements UseCase<String, SendMessageParams> {
  final ChatRepository repository;

  SendMessagesUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(SendMessageParams params) async {
    return await repository.sendMessage(params);
  }
}
