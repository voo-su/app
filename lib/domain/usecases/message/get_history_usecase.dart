import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/message_repository.dart';

class GetHistoryUseCase implements UseCase<MessageResponse, MessageParams> {
  final MessageRepository repository;

  GetHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, MessageResponse>> call(MessageParams params) async {
    return await repository.getHistory(params);
  }
}
