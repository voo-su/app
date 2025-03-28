//
//  Generated code. Do not modify.
//  source: group_chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createGroupChatRequestDescriptor instead')
const CreateGroupChatRequest$json = {
  '1': 'CreateGroupChatRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupChatRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVHcm91cENoYXRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use createGroupChatResponseDescriptor instead')
const CreateGroupChatResponse$json = {
  '1': 'CreateGroupChatResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `CreateGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGroupChatResponseDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVHcm91cENoYXRSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use getGroupChatRequestDescriptor instead')
const GetGroupChatRequest$json = {
  '1': 'GetGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupChatRequestDescriptor = $convert.base64Decode(
    'ChNHZXRHcm91cENoYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');

@$core.Deprecated('Use getGroupChatResponseDescriptor instead')
const GetGroupChatResponse$json = {
  '1': 'GetGroupChatResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'about', '3': 3, '4': 1, '5': 9, '10': 'about'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'members', '3': 5, '4': 1, '5': 3, '10': 'members'},
  ],
};

/// Descriptor for `GetGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupChatResponseDescriptor = $convert.base64Decode(
    'ChRHZXRHcm91cENoYXRSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIUCgVhYm91dBgDIAEoCVIFYWJvdXQSFgoGYXZhdGFyGAQgASgJUgZhdmF0YXISGAoHbWVt'
    'YmVycxgFIAEoA1IHbWVtYmVycw==');

@$core.Deprecated('Use getMembersRequestDescriptor instead')
const GetMembersRequest$json = {
  '1': 'GetMembersRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersRequestDescriptor = $convert.base64Decode(
    'ChFHZXRNZW1iZXJzUmVxdWVzdBIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use getMembersResponseDescriptor instead')
const GetMembersResponse$json = {
  '1': 'GetMembersResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.group_chat.MemberItem', '10': 'items'},
  ],
};

/// Descriptor for `GetMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMembersResponseDescriptor = $convert.base64Decode(
    'ChJHZXRNZW1iZXJzUmVzcG9uc2USLAoFaXRlbXMYASADKAsyFi5ncm91cF9jaGF0Lk1lbWJlck'
    'l0ZW1SBWl0ZW1z');

@$core.Deprecated('Use memberItemDescriptor instead')
const MemberItem$json = {
  '1': 'MemberItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
  ],
};

/// Descriptor for `MemberItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberItemDescriptor = $convert.base64Decode(
    'CgpNZW1iZXJJdGVtEg4KAmlkGAEgASgDUgJpZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbW'
    'USFgoGYXZhdGFyGAMgASgJUgZhdmF0YXISEgoEbmFtZRgEIAEoCVIEbmFtZRIYCgdzdXJuYW1l'
    'GAUgASgJUgdzdXJuYW1l');

@$core.Deprecated('Use addUserToGroupChatRequestDescriptor instead')
const AddUserToGroupChatRequest$json = {
  '1': 'AddUserToGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'user_ids', '3': 2, '4': 3, '5': 3, '10': 'userIds'},
  ],
};

/// Descriptor for `AddUserToGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToGroupChatRequestDescriptor = $convert.base64Decode(
    'ChlBZGRVc2VyVG9Hcm91cENoYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZBIZCgh1c2VyX2lkcx'
    'gCIAMoA1IHdXNlcklkcw==');

@$core.Deprecated('Use addUserToGroupChatResponseDescriptor instead')
const AddUserToGroupChatResponse$json = {
  '1': 'AddUserToGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddUserToGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToGroupChatResponseDescriptor = $convert.base64Decode(
    'ChpBZGRVc2VyVG9Hcm91cENoYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use removeUserFromGroupChatRequestDescriptor instead')
const RemoveUserFromGroupChatRequest$json = {
  '1': 'RemoveUserFromGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `RemoveUserFromGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromGroupChatRequestDescriptor = $convert.base64Decode(
    'Ch5SZW1vdmVVc2VyRnJvbUdyb3VwQ2hhdFJlcXVlc3QSDgoCaWQYASABKANSAmlkEhcKB3VzZX'
    'JfaWQYAiABKANSBnVzZXJJZA==');

@$core.Deprecated('Use removeUserFromGroupChatResponseDescriptor instead')
const RemoveUserFromGroupChatResponse$json = {
  '1': 'RemoveUserFromGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserFromGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromGroupChatResponseDescriptor = $convert.base64Decode(
    'Ch9SZW1vdmVVc2VyRnJvbUdyb3VwQ2hhdFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2'
    'Nlc3M=');

@$core.Deprecated('Use leaveGroupChatRequestDescriptor instead')
const LeaveGroupChatRequest$json = {
  '1': 'LeaveGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `LeaveGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveGroupChatRequestDescriptor = $convert.base64Decode(
    'ChVMZWF2ZUdyb3VwQ2hhdFJlcXVlc3QSDgoCaWQYASABKANSAmlk');

@$core.Deprecated('Use leaveGroupChatResponseDescriptor instead')
const LeaveGroupChatResponse$json = {
  '1': 'LeaveGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LeaveGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveGroupChatResponseDescriptor = $convert.base64Decode(
    'ChZMZWF2ZUdyb3VwQ2hhdFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use deleteGroupChatRequestDescriptor instead')
const DeleteGroupChatRequest$json = {
  '1': 'DeleteGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `DeleteGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupChatRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVHcm91cENoYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');

@$core.Deprecated('Use deleteGroupChatResponseDescriptor instead')
const DeleteGroupChatResponse$json = {
  '1': 'DeleteGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupChatResponseDescriptor = $convert.base64Decode(
    'ChdEZWxldGVHcm91cENoYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use editNameGroupChatRequestDescriptor instead')
const EditNameGroupChatRequest$json = {
  '1': 'EditNameGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `EditNameGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editNameGroupChatRequestDescriptor = $convert.base64Decode(
    'ChhFZGl0TmFtZUdyb3VwQ2hhdFJlcXVlc3QSDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKA'
    'lSBG5hbWU=');

@$core.Deprecated('Use editNameGroupChatResponseDescriptor instead')
const EditNameGroupChatResponse$json = {
  '1': 'EditNameGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditNameGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editNameGroupChatResponseDescriptor = $convert.base64Decode(
    'ChlFZGl0TmFtZUdyb3VwQ2hhdFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use editAboutGroupChatRequestDescriptor instead')
const EditAboutGroupChatRequest$json = {
  '1': 'EditAboutGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'about', '3': 2, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `EditAboutGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editAboutGroupChatRequestDescriptor = $convert.base64Decode(
    'ChlFZGl0QWJvdXRHcm91cENoYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZBIUCgVhYm91dBgCIA'
    'EoCVIFYWJvdXQ=');

@$core.Deprecated('Use editAboutGroupChatResponseDescriptor instead')
const EditAboutGroupChatResponse$json = {
  '1': 'EditAboutGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditAboutGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editAboutGroupChatResponseDescriptor = $convert.base64Decode(
    'ChpFZGl0QWJvdXRHcm91cENoYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use editPhotoGroupChatRequestDescriptor instead')
const EditPhotoGroupChatRequest$json = {
  '1': 'EditPhotoGroupChatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'photo', '3': 2, '4': 1, '5': 11, '6': '.common.InputPhoto', '10': 'photo'},
  ],
};

/// Descriptor for `EditPhotoGroupChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editPhotoGroupChatRequestDescriptor = $convert.base64Decode(
    'ChlFZGl0UGhvdG9Hcm91cENoYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZBIoCgVwaG90bxgCIA'
    'EoCzISLmNvbW1vbi5JbnB1dFBob3RvUgVwaG90bw==');

@$core.Deprecated('Use editPhotoGroupChatResponseDescriptor instead')
const EditPhotoGroupChatResponse$json = {
  '1': 'EditPhotoGroupChatResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditPhotoGroupChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editPhotoGroupChatResponseDescriptor = $convert.base64Decode(
    'ChpFZGl0UGhvdG9Hcm91cENoYXRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

