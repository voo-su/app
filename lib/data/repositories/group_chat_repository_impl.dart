import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/group_chat_remote_data_source.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class GroupChatRepositoryImpl implements GroupChatRepository {
  final GroupChatRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  GroupChatRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, GroupChat>> getGroupChat(int id) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.getGroupChat(token, id);

      return Right(
        GroupChat(
          id: response.id.toInt(),
          name: response.name,
          avatar: response.avatar,
          membersCount: response.members.toInt(),
        ),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
