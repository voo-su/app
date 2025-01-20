import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/message.pbgrpc.dart';
import 'package:voo_su/domain/entities/message.dart';

class MessageRemoteDataSource {
  final MessageServiceClient client;

  MessageRemoteDataSource(this.client);

  Future<GetHistoryResponse> getHistory(
    String token,
    MessageParams params,
  ) async {
    final request = GetHistoryRequest(
      chatType: Int64(params.chatType),
      receiverId: Int64(params.receiverId),
      recordId: Int64(params.recordId),
      limit: Int64(params.limit),
    );

    return await client.getHistory(
      request,
      options: CallOptions(
        metadata: {"Authorization": token},
      ),
    );
  }
}
