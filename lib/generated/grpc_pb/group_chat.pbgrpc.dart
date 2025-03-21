//
//  Generated code. Do not modify.
//  source: group_chat.proto
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

import 'group_chat.pb.dart' as $4;

export 'group_chat.pb.dart';

@$pb.GrpcServiceName('group_chat.GroupChatService')
class GroupChatServiceClient extends $grpc.Client {
  static final _$createGroupChat = $grpc.ClientMethod<$4.CreateGroupChatRequest, $4.CreateGroupChatResponse>(
      '/group_chat.GroupChatService/CreateGroupChat',
      ($4.CreateGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.CreateGroupChatResponse.fromBuffer(value));
  static final _$getGroupChat = $grpc.ClientMethod<$4.GetGroupChatRequest, $4.GetGroupChatResponse>(
      '/group_chat.GroupChatService/GetGroupChat',
      ($4.GetGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetGroupChatResponse.fromBuffer(value));
  static final _$getMembers = $grpc.ClientMethod<$4.GetMembersRequest, $4.GetMembersResponse>(
      '/group_chat.GroupChatService/GetMembers',
      ($4.GetMembersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.GetMembersResponse.fromBuffer(value));
  static final _$addUserToGroupChat = $grpc.ClientMethod<$4.AddUserToGroupChatRequest, $4.AddUserToGroupChatResponse>(
      '/group_chat.GroupChatService/AddUserToGroupChat',
      ($4.AddUserToGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.AddUserToGroupChatResponse.fromBuffer(value));
  static final _$removeUserFromGroupChat = $grpc.ClientMethod<$4.RemoveUserFromGroupChatRequest, $4.RemoveUserFromGroupChatResponse>(
      '/group_chat.GroupChatService/RemoveUserFromGroupChat',
      ($4.RemoveUserFromGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.RemoveUserFromGroupChatResponse.fromBuffer(value));
  static final _$leaveGroupChat = $grpc.ClientMethod<$4.LeaveGroupChatRequest, $4.LeaveGroupChatResponse>(
      '/group_chat.GroupChatService/LeaveGroupChat',
      ($4.LeaveGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.LeaveGroupChatResponse.fromBuffer(value));
  static final _$deleteGroupChat = $grpc.ClientMethod<$4.DeleteGroupChatRequest, $4.DeleteGroupChatResponse>(
      '/group_chat.GroupChatService/DeleteGroupChat',
      ($4.DeleteGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.DeleteGroupChatResponse.fromBuffer(value));
  static final _$editNameGroupChat = $grpc.ClientMethod<$4.EditNameGroupChatRequest, $4.EditNameGroupChatResponse>(
      '/group_chat.GroupChatService/EditNameGroupChat',
      ($4.EditNameGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.EditNameGroupChatResponse.fromBuffer(value));
  static final _$editAboutGroupChat = $grpc.ClientMethod<$4.EditAboutGroupChatRequest, $4.EditAboutGroupChatResponse>(
      '/group_chat.GroupChatService/EditAboutGroupChat',
      ($4.EditAboutGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.EditAboutGroupChatResponse.fromBuffer(value));
  static final _$editPhotoGroupChat = $grpc.ClientMethod<$4.EditPhotoGroupChatRequest, $4.EditPhotoGroupChatResponse>(
      '/group_chat.GroupChatService/EditPhotoGroupChat',
      ($4.EditPhotoGroupChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.EditPhotoGroupChatResponse.fromBuffer(value));

  GroupChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.CreateGroupChatResponse> createGroupChat($4.CreateGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetGroupChatResponse> getGroupChat($4.GetGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetMembersResponse> getMembers($4.GetMembersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMembers, request, options: options);
  }

  $grpc.ResponseFuture<$4.AddUserToGroupChatResponse> addUserToGroupChat($4.AddUserToGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addUserToGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.RemoveUserFromGroupChatResponse> removeUserFromGroupChat($4.RemoveUserFromGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeUserFromGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.LeaveGroupChatResponse> leaveGroupChat($4.LeaveGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.DeleteGroupChatResponse> deleteGroupChat($4.DeleteGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.EditNameGroupChatResponse> editNameGroupChat($4.EditNameGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editNameGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.EditAboutGroupChatResponse> editAboutGroupChat($4.EditAboutGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editAboutGroupChat, request, options: options);
  }

  $grpc.ResponseFuture<$4.EditPhotoGroupChatResponse> editPhotoGroupChat($4.EditPhotoGroupChatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editPhotoGroupChat, request, options: options);
  }
}

@$pb.GrpcServiceName('group_chat.GroupChatService')
abstract class GroupChatServiceBase extends $grpc.Service {
  $core.String get $name => 'group_chat.GroupChatService';

  GroupChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.CreateGroupChatRequest, $4.CreateGroupChatResponse>(
        'CreateGroupChat',
        createGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.CreateGroupChatRequest.fromBuffer(value),
        ($4.CreateGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetGroupChatRequest, $4.GetGroupChatResponse>(
        'GetGroupChat',
        getGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetGroupChatRequest.fromBuffer(value),
        ($4.GetGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetMembersRequest, $4.GetMembersResponse>(
        'GetMembers',
        getMembers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetMembersRequest.fromBuffer(value),
        ($4.GetMembersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AddUserToGroupChatRequest, $4.AddUserToGroupChatResponse>(
        'AddUserToGroupChat',
        addUserToGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.AddUserToGroupChatRequest.fromBuffer(value),
        ($4.AddUserToGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.RemoveUserFromGroupChatRequest, $4.RemoveUserFromGroupChatResponse>(
        'RemoveUserFromGroupChat',
        removeUserFromGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.RemoveUserFromGroupChatRequest.fromBuffer(value),
        ($4.RemoveUserFromGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.LeaveGroupChatRequest, $4.LeaveGroupChatResponse>(
        'LeaveGroupChat',
        leaveGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.LeaveGroupChatRequest.fromBuffer(value),
        ($4.LeaveGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.DeleteGroupChatRequest, $4.DeleteGroupChatResponse>(
        'DeleteGroupChat',
        deleteGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.DeleteGroupChatRequest.fromBuffer(value),
        ($4.DeleteGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.EditNameGroupChatRequest, $4.EditNameGroupChatResponse>(
        'EditNameGroupChat',
        editNameGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.EditNameGroupChatRequest.fromBuffer(value),
        ($4.EditNameGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.EditAboutGroupChatRequest, $4.EditAboutGroupChatResponse>(
        'EditAboutGroupChat',
        editAboutGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.EditAboutGroupChatRequest.fromBuffer(value),
        ($4.EditAboutGroupChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.EditPhotoGroupChatRequest, $4.EditPhotoGroupChatResponse>(
        'EditPhotoGroupChat',
        editPhotoGroupChat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.EditPhotoGroupChatRequest.fromBuffer(value),
        ($4.EditPhotoGroupChatResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.CreateGroupChatResponse> createGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.CreateGroupChatRequest> request) async {
    return createGroupChat(call, await request);
  }

  $async.Future<$4.GetGroupChatResponse> getGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.GetGroupChatRequest> request) async {
    return getGroupChat(call, await request);
  }

  $async.Future<$4.GetMembersResponse> getMembers_Pre($grpc.ServiceCall call, $async.Future<$4.GetMembersRequest> request) async {
    return getMembers(call, await request);
  }

  $async.Future<$4.AddUserToGroupChatResponse> addUserToGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.AddUserToGroupChatRequest> request) async {
    return addUserToGroupChat(call, await request);
  }

  $async.Future<$4.RemoveUserFromGroupChatResponse> removeUserFromGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.RemoveUserFromGroupChatRequest> request) async {
    return removeUserFromGroupChat(call, await request);
  }

  $async.Future<$4.LeaveGroupChatResponse> leaveGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.LeaveGroupChatRequest> request) async {
    return leaveGroupChat(call, await request);
  }

  $async.Future<$4.DeleteGroupChatResponse> deleteGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.DeleteGroupChatRequest> request) async {
    return deleteGroupChat(call, await request);
  }

  $async.Future<$4.EditNameGroupChatResponse> editNameGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.EditNameGroupChatRequest> request) async {
    return editNameGroupChat(call, await request);
  }

  $async.Future<$4.EditAboutGroupChatResponse> editAboutGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.EditAboutGroupChatRequest> request) async {
    return editAboutGroupChat(call, await request);
  }

  $async.Future<$4.EditPhotoGroupChatResponse> editPhotoGroupChat_Pre($grpc.ServiceCall call, $async.Future<$4.EditPhotoGroupChatRequest> request) async {
    return editPhotoGroupChat(call, await request);
  }

  $async.Future<$4.CreateGroupChatResponse> createGroupChat($grpc.ServiceCall call, $4.CreateGroupChatRequest request);
  $async.Future<$4.GetGroupChatResponse> getGroupChat($grpc.ServiceCall call, $4.GetGroupChatRequest request);
  $async.Future<$4.GetMembersResponse> getMembers($grpc.ServiceCall call, $4.GetMembersRequest request);
  $async.Future<$4.AddUserToGroupChatResponse> addUserToGroupChat($grpc.ServiceCall call, $4.AddUserToGroupChatRequest request);
  $async.Future<$4.RemoveUserFromGroupChatResponse> removeUserFromGroupChat($grpc.ServiceCall call, $4.RemoveUserFromGroupChatRequest request);
  $async.Future<$4.LeaveGroupChatResponse> leaveGroupChat($grpc.ServiceCall call, $4.LeaveGroupChatRequest request);
  $async.Future<$4.DeleteGroupChatResponse> deleteGroupChat($grpc.ServiceCall call, $4.DeleteGroupChatRequest request);
  $async.Future<$4.EditNameGroupChatResponse> editNameGroupChat($grpc.ServiceCall call, $4.EditNameGroupChatRequest request);
  $async.Future<$4.EditAboutGroupChatResponse> editAboutGroupChat($grpc.ServiceCall call, $4.EditAboutGroupChatRequest request);
  $async.Future<$4.EditPhotoGroupChatResponse> editPhotoGroupChat($grpc.ServiceCall call, $4.EditPhotoGroupChatRequest request);
}
