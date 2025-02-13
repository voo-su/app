import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/message_remote_data_source.dart';
import 'package:voo_su/domain/entities/message.dart';
import 'package:voo_su/domain/repositories/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  MessageRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<Failure, MessageResponse>> getHistory(params) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.getHistory(token, params);

      List<Message> message = response.items
          .map((item) => Message(
                id: item.id,
                chatType: item.chatType,
                receiverId: item.receiverId.toInt(),
                userId: item.userId.toInt(),
                msgType: item.msgType,
                content: item.content,
                isRead: item.isRead,
                createdAt: item.createdAt,
              ))
          .toList();

      return Right(MessageResponse(messages: message));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, String>> sendMessage(params) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.sendMessage(token, params);

      return Right(response.id);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
