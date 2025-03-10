import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';

class GrpcInterceptor extends ClientInterceptor {
  final AuthLocalDataSource localDataSource;

  GrpcInterceptor(this.localDataSource);

  // https://github.com/grpc/grpc-dart/issues/544
  FutureOr<void> _tokenProvider(Map<String, String> metadata, String _) async {
    final token = await localDataSource.getToken();
    metadata['Authorization'] = token;
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      request,
      options.mergedWith(CallOptions(providers: [_tokenProvider])),
    );
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      requests,
      options.mergedWith(CallOptions(providers: [_tokenProvider])),
    );
  }
}
