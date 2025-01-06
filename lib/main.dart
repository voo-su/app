import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';

Future<void> main() async {
  final channel = ClientChannel(
    '192.168.0.2',
    port: 50051,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final client  = AuthServiceClient(channel);

  final request = AuthLoginRequest(
    email: "info@magomedcoder.ru",
    platform: "android",
  );

  final login = await client.login(request);
print(login.token);
}
