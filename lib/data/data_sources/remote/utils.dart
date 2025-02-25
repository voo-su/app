import 'package:grpc/grpc.dart';

CallOptions createAuthOptions(String token) {
  return CallOptions(metadata: {"Authorization": token});
}
