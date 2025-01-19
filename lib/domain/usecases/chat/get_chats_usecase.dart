import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class GetChatsUseCase implements UseCase<ChatResponse, ChatParams> {
  final ChatRepository repository;

  GetChatsUseCase(this.repository);

  @override
  Future<Either<Failure, ChatResponse>> call(ChatParams params) async {
    return await repository.getChats(params);
  }
}
