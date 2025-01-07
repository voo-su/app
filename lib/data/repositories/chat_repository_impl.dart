import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  ChatRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<Failure, ChatResponse>> getChats(params) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.list(token);

      List<Chat> chatList = response.items
          .map((item) => Chat(
                id: item.id,
                chatType: item.chatType,
                username: item.username,
                avatar: item.avatar,
                name: item.name,
                surname: item.surname,
                msgText: item.msgText,
                unreadNum: item.unreadNum,
                updatedAt: item.updatedAt,

                // TODO
                isSeen: false,
                isOnline: false,
              ))
          .toList();

      return Right(ChatResponse(chats: chatList));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
