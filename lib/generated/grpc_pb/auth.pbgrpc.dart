//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $1;

export 'auth.pb.dart';

@$pb.GrpcServiceName('auth.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$1.AuthLoginRequest, $1.AuthLoginResponse>(
      '/auth.AuthService/Login',
      ($1.AuthLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthLoginResponse.fromBuffer(value));
  static final _$verify = $grpc.ClientMethod<$1.AuthVerifyRequest, $1.AuthVerifyResponse>(
      '/auth.AuthService/Verify',
      ($1.AuthVerifyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthVerifyResponse.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$1.AuthLogoutRequest, $1.AuthLogoutResponse>(
      '/auth.AuthService/Logout',
      ($1.AuthLogoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.AuthLogoutResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.AuthLoginResponse> login($1.AuthLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.AuthVerifyResponse> verify($1.AuthVerifyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify, request, options: options);
  }

  $grpc.ResponseFuture<$1.AuthLogoutResponse> logout($1.AuthLogoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }
}

@$pb.GrpcServiceName('auth.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'auth.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.AuthLoginRequest, $1.AuthLoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AuthLoginRequest.fromBuffer(value),
        ($1.AuthLoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AuthVerifyRequest, $1.AuthVerifyResponse>(
        'Verify',
        verify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AuthVerifyRequest.fromBuffer(value),
        ($1.AuthVerifyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.AuthLogoutRequest, $1.AuthLogoutResponse>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.AuthLogoutRequest.fromBuffer(value),
        ($1.AuthLogoutResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.AuthLoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$1.AuthLoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.AuthVerifyResponse> verify_Pre($grpc.ServiceCall call, $async.Future<$1.AuthVerifyRequest> request) async {
    return verify(call, await request);
  }

  $async.Future<$1.AuthLogoutResponse> logout_Pre($grpc.ServiceCall call, $async.Future<$1.AuthLogoutRequest> request) async {
    return logout(call, await request);
  }

  $async.Future<$1.AuthLoginResponse> login($grpc.ServiceCall call, $1.AuthLoginRequest request);
  $async.Future<$1.AuthVerifyResponse> verify($grpc.ServiceCall call, $1.AuthVerifyRequest request);
  $async.Future<$1.AuthLogoutResponse> logout($grpc.ServiceCall call, $1.AuthLogoutRequest request);
}
