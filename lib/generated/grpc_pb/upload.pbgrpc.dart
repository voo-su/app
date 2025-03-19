//
//  Generated code. Do not modify.
//  source: upload.proto
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

import 'upload.pb.dart' as $5;

export 'upload.pb.dart';

@$pb.GrpcServiceName('upload.UploadService')
class UploadServiceClient extends $grpc.Client {
  static final _$saveFilePart = $grpc.ClientMethod<$5.SaveFilePartRequest, $5.SaveFilePartResponse>(
      '/upload.UploadService/SaveFilePart',
      ($5.SaveFilePartRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.SaveFilePartResponse.fromBuffer(value));

  UploadServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$5.SaveFilePartResponse> saveFilePart($5.SaveFilePartRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveFilePart, request, options: options);
  }
}

@$pb.GrpcServiceName('upload.UploadService')
abstract class UploadServiceBase extends $grpc.Service {
  $core.String get $name => 'upload.UploadService';

  UploadServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.SaveFilePartRequest, $5.SaveFilePartResponse>(
        'SaveFilePart',
        saveFilePart_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.SaveFilePartRequest.fromBuffer(value),
        ($5.SaveFilePartResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.SaveFilePartResponse> saveFilePart_Pre($grpc.ServiceCall call, $async.Future<$5.SaveFilePartRequest> request) async {
    return saveFilePart(call, await request);
  }

  $async.Future<$5.SaveFilePartResponse> saveFilePart($grpc.ServiceCall call, $5.SaveFilePartRequest request);
}
