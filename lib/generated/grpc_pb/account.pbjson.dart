//
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getProfileRequestDescriptor instead')
const GetProfileRequest$json = {
  '1': 'GetProfileRequest',
};

/// Descriptor for `GetProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQcm9maWxlUmVxdWVzdA==');

@$core.Deprecated('Use getProfileResponseDescriptor instead')
const GetProfileResponse$json = {
  '1': 'GetProfileResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'avatar', '3': 2, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 6, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'gender', '3': 7, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'birthday', '3': 8, '4': 1, '5': 9, '10': 'birthday'},
    {'1': 'about', '3': 9, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `GetProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9maWxlUmVzcG9uc2USDgoCaWQYASABKANSAmlkEhoKCHVzZXJuYW1lGAMgASgJUg'
    'h1c2VybmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSFgoGYXZhdGFyGAIgASgJUgZhdmF0YXIS'
    'EgoEbmFtZRgFIAEoCVIEbmFtZRIYCgdzdXJuYW1lGAYgASgJUgdzdXJuYW1lEhYKBmdlbmRlch'
    'gHIAEoBVIGZ2VuZGVyEhoKCGJpcnRoZGF5GAggASgJUghiaXJ0aGRheRIUCgVhYm91dBgJIAEo'
    'CVIFYWJvdXQ=');

@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = {
  '1': 'UpdateProfileRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 2, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'gender', '3': 3, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'birthday', '3': 4, '4': 1, '5': 9, '10': 'birthday'},
    {'1': 'about', '3': 5, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9maWxlUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhgKB3N1cm5hbWUYAi'
    'ABKAlSB3N1cm5hbWUSFgoGZ2VuZGVyGAMgASgFUgZnZW5kZXISGgoIYmlydGhkYXkYBCABKAlS'
    'CGJpcnRoZGF5EhQKBWFib3V0GAUgASgJUgVhYm91dA==');

@$core.Deprecated('Use updateProfileResponseDescriptor instead')
const UpdateProfileResponse$json = {
  '1': 'UpdateProfileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9maWxlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use updateProfilePhotoRequestDescriptor instead')
const UpdateProfilePhotoRequest$json = {
  '1': 'UpdateProfilePhotoRequest',
  '2': [
    {'1': 'photo', '3': 1, '4': 1, '5': 12, '10': 'photo'},
  ],
};

/// Descriptor for `UpdateProfilePhotoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVQcm9maWxlUGhvdG9SZXF1ZXN0EhQKBXBob3RvGAEgASgMUgVwaG90bw==');

@$core.Deprecated('Use updateProfilePhotoResponseDescriptor instead')
const UpdateProfilePhotoResponse$json = {
  '1': 'UpdateProfilePhotoResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateProfilePhotoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVQcm9maWxlUGhvdG9SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use entityNotifySettingsDescriptor instead')
const EntityNotifySettings$json = {
  '1': 'EntityNotifySettings',
  '2': [
    {'1': 'mute_until', '3': 1, '4': 1, '5': 5, '10': 'muteUntil'},
    {'1': 'silent', '3': 2, '4': 1, '5': 8, '10': 'silent'},
    {'1': 'show_previews', '3': 3, '4': 1, '5': 8, '10': 'showPreviews'},
  ],
};

/// Descriptor for `EntityNotifySettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityNotifySettingsDescriptor = $convert.base64Decode(
    'ChRFbnRpdHlOb3RpZnlTZXR0aW5ncxIdCgptdXRlX3VudGlsGAEgASgFUgltdXRlVW50aWwSFg'
    'oGc2lsZW50GAIgASgIUgZzaWxlbnQSIwoNc2hvd19wcmV2aWV3cxgDIAEoCFIMc2hvd1ByZXZp'
    'ZXdz');

@$core.Deprecated('Use notifyEntityDescriptor instead')
const NotifyEntity$json = {
  '1': 'NotifyEntity',
  '2': [
    {'1': 'chats', '3': 2, '4': 1, '5': 11, '6': '.account.EntityChats', '9': 0, '10': 'chats'},
    {'1': 'groups', '3': 1, '4': 1, '5': 11, '6': '.account.EntityGroups', '9': 0, '10': 'groups'},
    {'1': 'chat', '3': 4, '4': 1, '5': 11, '6': '.account.EntityChat', '9': 0, '10': 'chat'},
    {'1': 'group', '3': 5, '4': 1, '5': 11, '6': '.account.EntityGroup', '9': 0, '10': 'group'},
  ],
  '8': [
    {'1': 'entity'},
  ],
};

/// Descriptor for `NotifyEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifyEntityDescriptor = $convert.base64Decode(
    'CgxOb3RpZnlFbnRpdHkSLAoFY2hhdHMYAiABKAsyFC5hY2NvdW50LkVudGl0eUNoYXRzSABSBW'
    'NoYXRzEi8KBmdyb3VwcxgBIAEoCzIVLmFjY291bnQuRW50aXR5R3JvdXBzSABSBmdyb3VwcxIp'
    'CgRjaGF0GAQgASgLMhMuYWNjb3VudC5FbnRpdHlDaGF0SABSBGNoYXQSLAoFZ3JvdXAYBSABKA'
    'syFC5hY2NvdW50LkVudGl0eUdyb3VwSABSBWdyb3VwQggKBmVudGl0eQ==');

@$core.Deprecated('Use entityChatsDescriptor instead')
const EntityChats$json = {
  '1': 'EntityChats',
};

/// Descriptor for `EntityChats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityChatsDescriptor = $convert.base64Decode(
    'CgtFbnRpdHlDaGF0cw==');

@$core.Deprecated('Use entityGroupsDescriptor instead')
const EntityGroups$json = {
  '1': 'EntityGroups',
};

/// Descriptor for `EntityGroups`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityGroupsDescriptor = $convert.base64Decode(
    'CgxFbnRpdHlHcm91cHM=');

@$core.Deprecated('Use entityChatDescriptor instead')
const EntityChat$json = {
  '1': 'EntityChat',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 3, '10': 'chatId'},
  ],
};

/// Descriptor for `EntityChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityChatDescriptor = $convert.base64Decode(
    'CgpFbnRpdHlDaGF0EhcKB2NoYXRfaWQYASABKANSBmNoYXRJZA==');

@$core.Deprecated('Use entityGroupDescriptor instead')
const EntityGroup$json = {
  '1': 'EntityGroup',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 3, '10': 'groupId'},
  ],
};

/// Descriptor for `EntityGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List entityGroupDescriptor = $convert.base64Decode(
    'CgtFbnRpdHlHcm91cBIZCghncm91cF9pZBgBIAEoA1IHZ3JvdXBJZA==');

@$core.Deprecated('Use getNotifySettingsRequestDescriptor instead')
const GetNotifySettingsRequest$json = {
  '1': 'GetNotifySettingsRequest',
  '2': [
    {'1': 'entity', '3': 1, '4': 1, '5': 11, '6': '.account.NotifyEntity', '10': 'entity'},
  ],
};

/// Descriptor for `GetNotifySettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotifySettingsRequestDescriptor = $convert.base64Decode(
    'ChhHZXROb3RpZnlTZXR0aW5nc1JlcXVlc3QSLQoGZW50aXR5GAEgASgLMhUuYWNjb3VudC5Ob3'
    'RpZnlFbnRpdHlSBmVudGl0eQ==');

@$core.Deprecated('Use getNotifySettingsResponseDescriptor instead')
const GetNotifySettingsResponse$json = {
  '1': 'GetNotifySettingsResponse',
  '2': [
    {'1': 'settings', '3': 1, '4': 1, '5': 11, '6': '.account.EntityNotifySettings', '10': 'settings'},
  ],
};

/// Descriptor for `GetNotifySettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotifySettingsResponseDescriptor = $convert.base64Decode(
    'ChlHZXROb3RpZnlTZXR0aW5nc1Jlc3BvbnNlEjkKCHNldHRpbmdzGAEgASgLMh0uYWNjb3VudC'
    '5FbnRpdHlOb3RpZnlTZXR0aW5nc1IIc2V0dGluZ3M=');

@$core.Deprecated('Use updateNotifySettingsRequestDescriptor instead')
const UpdateNotifySettingsRequest$json = {
  '1': 'UpdateNotifySettingsRequest',
  '2': [
    {'1': 'entity', '3': 1, '4': 1, '5': 11, '6': '.account.NotifyEntity', '10': 'entity'},
    {'1': 'settings', '3': 2, '4': 1, '5': 11, '6': '.account.EntityNotifySettings', '10': 'settings'},
  ],
};

/// Descriptor for `UpdateNotifySettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotifySettingsRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVOb3RpZnlTZXR0aW5nc1JlcXVlc3QSLQoGZW50aXR5GAEgASgLMhUuYWNjb3VudC'
    '5Ob3RpZnlFbnRpdHlSBmVudGl0eRI5CghzZXR0aW5ncxgCIAEoCzIdLmFjY291bnQuRW50aXR5'
    'Tm90aWZ5U2V0dGluZ3NSCHNldHRpbmdz');

@$core.Deprecated('Use updateNotifySettingsResponseDescriptor instead')
const UpdateNotifySettingsResponse$json = {
  '1': 'UpdateNotifySettingsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateNotifySettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotifySettingsResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVOb3RpZnlTZXR0aW5nc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
    'M=');

@$core.Deprecated('Use registerDeviceRequestDescriptor instead')
const RegisterDeviceRequest$json = {
  '1': 'RegisterDeviceRequest',
  '2': [
    {'1': 'token_type', '3': 1, '4': 1, '5': 5, '10': 'tokenType'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlckRldmljZVJlcXVlc3QSHQoKdG9rZW5fdHlwZRgBIAEoBVIJdG9rZW5UeXBlEh'
    'QKBXRva2VuGAIgASgJUgV0b2tlbg==');

@$core.Deprecated('Use registerDeviceResponseDescriptor instead')
const RegisterDeviceResponse$json = {
  '1': 'RegisterDeviceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RegisterDeviceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceResponseDescriptor = $convert.base64Decode(
    'ChZSZWdpc3RlckRldmljZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

