//
//  Generated code. Do not modify.
//  source: contact.proto
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

import 'contact.pb.dart' as $3;

export 'contact.pb.dart';

@$pb.GrpcServiceName('contact.ContactService')
class ContactServiceClient extends $grpc.Client {
  static final _$getContacts = $grpc.ClientMethod<$3.GetContactsRequest, $3.GetContactsResponse>(
      '/contact.ContactService/GetContacts',
      ($3.GetContactsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetContactsResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$3.GetUserRequest, $3.GetUserResponse>(
      '/contact.ContactService/GetUser',
      ($3.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetUserResponse.fromBuffer(value));
  static final _$search = $grpc.ClientMethod<$3.SearchRequest, $3.SearchResponse>(
      '/contact.ContactService/Search',
      ($3.SearchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.SearchResponse.fromBuffer(value));

  ContactServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$3.GetContactsResponse> getContacts($3.GetContactsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getContacts, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetUserResponse> getUser($3.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$3.SearchResponse> search($3.SearchRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }
}

@$pb.GrpcServiceName('contact.ContactService')
abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'contact.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.GetContactsRequest, $3.GetContactsResponse>(
        'GetContacts',
        getContacts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetContactsRequest.fromBuffer(value),
        ($3.GetContactsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetUserRequest, $3.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetUserRequest.fromBuffer(value),
        ($3.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.SearchRequest, $3.SearchResponse>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.SearchRequest.fromBuffer(value),
        ($3.SearchResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.GetContactsResponse> getContacts_Pre($grpc.ServiceCall call, $async.Future<$3.GetContactsRequest> request) async {
    return getContacts(call, await request);
  }

  $async.Future<$3.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$3.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$3.SearchResponse> search_Pre($grpc.ServiceCall call, $async.Future<$3.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$3.GetContactsResponse> getContacts($grpc.ServiceCall call, $3.GetContactsRequest request);
  $async.Future<$3.GetUserResponse> getUser($grpc.ServiceCall call, $3.GetUserRequest request);
  $async.Future<$3.SearchResponse> search($grpc.ServiceCall call, $3.SearchRequest request);
}
