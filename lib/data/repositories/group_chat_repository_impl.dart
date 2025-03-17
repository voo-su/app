import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/group_chat_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pb.dart';
import 'package:voo_su/domain/entities/chat.dart';
import 'package:voo_su/domain/repositories/group_chat_repository.dart';

class GroupChatRepositoryImpl implements GroupChatRepository {
  final GroupChatRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  GroupChatRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, GetGroupChatResponse>> getGroupChat(int id) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.getGroupChat(token, id);

      print("response - $response");

      return Right(response);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, GetMembersResponse>> getMembers(int id) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.getMembers(token, id);
      return Right(response);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, AddUserToGroupChatResponse>> addUserToGroupChat(
    AddUserParams params,
  ) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.addUserToGroupChat(token, params);
      return Right(response);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, RemoveUserFromGroupChatResponse>>
  removeUserFromGroupChat(RemoveUserParams params) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.removeUserFromGroupChat(
        token,
        params,
      );
      return Right(response);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, LeaveGroupChatResponse>> leaveGroupChat(int id) async {
    try {
      final token = await localDataSource.getToken();
      final response = await remoteDataSource.leaveGroupChat(token, id);
      return Right(response);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
