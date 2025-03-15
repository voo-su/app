import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pb.dart';

abstract class GroupChatRepository {
  Future<Either<Failure, GetGroupChatResponse>> getGroupChat(int id);
  Future<Either<Failure, GetMembersResponse>> getMembers(int id);
}
