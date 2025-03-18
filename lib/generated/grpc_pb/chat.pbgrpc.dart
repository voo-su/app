//
//  Generated code. Do not modify.
//  source: chat.proto
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

import 'chat.pb.dart' as $2;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$getUpdates = $grpc.ClientMethod<$2.UpdatesRequest, $2.Update>(
      '/chat.ChatService/GetUpdates',
      ($2.UpdatesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Update.fromBuffer(value));
  static final _$getChats = $grpc.ClientMethod<$2.GetChatsRequest, $2.GetChatsResponse>(
      '/chat.ChatService/GetChats',
      ($2.GetChatsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetChatsResponse.fromBuffer(value));
  static final _$getHistory = $grpc.ClientMethod<$2.GetHistoryRequest, $2.GetHistoryResponse>(
      '/chat.ChatService/GetHistory',
      ($2.GetHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetHistoryResponse.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$2.SendMessageRequest, $2.SendMessageResponse>(
      '/chat.ChatService/SendMessage',
      ($2.SendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.SendMessageResponse.fromBuffer(value));
  static final _$sendPhoto = $grpc.ClientMethod<$2.SendPhotoRequest, $2.SendPhotoResponse>(
      '/chat.ChatService/SendPhoto',
      ($2.SendPhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.SendPhotoResponse.fromBuffer(value));
  static final _$viewMessages = $grpc.ClientMethod<$2.ViewMessagesRequest, $2.ViewMessagesResponse>(
      '/chat.ChatService/ViewMessages',
      ($2.ViewMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ViewMessagesResponse.fromBuffer(value));
  static final _$deleteMessages = $grpc.ClientMethod<$2.DeleteMessagesRequest, $2.DeleteMessagesResponse>(
      '/chat.ChatService/DeleteMessages',
      ($2.DeleteMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.DeleteMessagesResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$2.Update> getUpdates($2.UpdatesRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getUpdates, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$2.GetChatsResponse> getChats($2.GetChatsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChats, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetHistoryResponse> getHistory($2.GetHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistory, request, options: options);
  }

  $grpc.ResponseFuture<$2.SendMessageResponse> sendMessage($2.SendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$2.SendPhotoResponse> sendPhoto($2.SendPhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendPhoto, request, options: options);
  }

  $grpc.ResponseFuture<$2.ViewMessagesResponse> viewMessages($2.ViewMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$viewMessages, request, options: options);
  }

  $grpc.ResponseFuture<$2.DeleteMessagesResponse> deleteMessages($2.DeleteMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMessages, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.UpdatesRequest, $2.Update>(
        'GetUpdates',
        getUpdates_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.UpdatesRequest.fromBuffer(value),
        ($2.Update value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetChatsRequest, $2.GetChatsResponse>(
        'GetChats',
        getChats_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetChatsRequest.fromBuffer(value),
        ($2.GetChatsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetHistoryRequest, $2.GetHistoryResponse>(
        'GetHistory',
        getHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetHistoryRequest.fromBuffer(value),
        ($2.GetHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SendMessageRequest, $2.SendMessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SendMessageRequest.fromBuffer(value),
        ($2.SendMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SendPhotoRequest, $2.SendPhotoResponse>(
        'SendPhoto',
        sendPhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SendPhotoRequest.fromBuffer(value),
        ($2.SendPhotoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ViewMessagesRequest, $2.ViewMessagesResponse>(
        'ViewMessages',
        viewMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ViewMessagesRequest.fromBuffer(value),
        ($2.ViewMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteMessagesRequest, $2.DeleteMessagesResponse>(
        'DeleteMessages',
        deleteMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteMessagesRequest.fromBuffer(value),
        ($2.DeleteMessagesResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$2.Update> getUpdates_Pre($grpc.ServiceCall call, $async.Future<$2.UpdatesRequest> request) async* {
    yield* getUpdates(call, await request);
  }

  $async.Future<$2.GetChatsResponse> getChats_Pre($grpc.ServiceCall call, $async.Future<$2.GetChatsRequest> request) async {
    return getChats(call, await request);
  }

  $async.Future<$2.GetHistoryResponse> getHistory_Pre($grpc.ServiceCall call, $async.Future<$2.GetHistoryRequest> request) async {
    return getHistory(call, await request);
  }

  $async.Future<$2.SendMessageResponse> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$2.SendMessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$2.SendPhotoResponse> sendPhoto_Pre($grpc.ServiceCall call, $async.Future<$2.SendPhotoRequest> request) async {
    return sendPhoto(call, await request);
  }

  $async.Future<$2.ViewMessagesResponse> viewMessages_Pre($grpc.ServiceCall call, $async.Future<$2.ViewMessagesRequest> request) async {
    return viewMessages(call, await request);
  }

  $async.Future<$2.DeleteMessagesResponse> deleteMessages_Pre($grpc.ServiceCall call, $async.Future<$2.DeleteMessagesRequest> request) async {
    return deleteMessages(call, await request);
  }

  $async.Stream<$2.Update> getUpdates($grpc.ServiceCall call, $2.UpdatesRequest request);
  $async.Future<$2.GetChatsResponse> getChats($grpc.ServiceCall call, $2.GetChatsRequest request);
  $async.Future<$2.GetHistoryResponse> getHistory($grpc.ServiceCall call, $2.GetHistoryRequest request);
  $async.Future<$2.SendMessageResponse> sendMessage($grpc.ServiceCall call, $2.SendMessageRequest request);
  $async.Future<$2.SendPhotoResponse> sendPhoto($grpc.ServiceCall call, $2.SendPhotoRequest request);
  $async.Future<$2.ViewMessagesResponse> viewMessages($grpc.ServiceCall call, $2.ViewMessagesRequest request);
  $async.Future<$2.DeleteMessagesResponse> deleteMessages($grpc.ServiceCall call, $2.DeleteMessagesRequest request);
}
