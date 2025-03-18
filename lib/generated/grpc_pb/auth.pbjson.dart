//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authLoginRequestDescriptor instead')
const AuthLoginRequest$json = {
  '1': 'AuthLoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'platform', '3': 2, '4': 1, '5': 9, '10': 'platform'},
  ],
};

/// Descriptor for `AuthLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authLoginRequestDescriptor = $convert.base64Decode(
    'ChBBdXRoTG9naW5SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwbGF0Zm9ybRgCIA'
    'EoCVIIcGxhdGZvcm0=');

@$core.Deprecated('Use authLoginResponseDescriptor instead')
const AuthLoginResponse$json = {
  '1': 'AuthLoginResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'expires_in', '3': 2, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `AuthLoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authLoginResponseDescriptor = $convert.base64Decode(
    'ChFBdXRoTG9naW5SZXNwb25zZRIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SHQoKZXhwaXJlc19pbh'
    'gCIAEoA1IJZXhwaXJlc0lu');

@$core.Deprecated('Use authVerifyRequestDescriptor instead')
const AuthVerifyRequest$json = {
  '1': 'AuthVerifyRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `AuthVerifyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authVerifyRequestDescriptor = $convert.base64Decode(
    'ChFBdXRoVmVyaWZ5UmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SEgoEY29kZRgCIAEoCV'
    'IEY29kZQ==');

@$core.Deprecated('Use authVerifyResponseDescriptor instead')
const AuthVerifyResponse$json = {
  '1': 'AuthVerifyResponse',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 3, '10': 'expiresIn'},
  ],
};

/// Descriptor for `AuthVerifyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authVerifyResponseDescriptor = $convert.base64Decode(
    'ChJBdXRoVmVyaWZ5UmVzcG9uc2USEgoEdHlwZRgBIAEoCVIEdHlwZRIhCgxhY2Nlc3NfdG9rZW'
    '4YAiABKAlSC2FjY2Vzc1Rva2VuEh0KCmV4cGlyZXNfaW4YAyABKANSCWV4cGlyZXNJbg==');

@$core.Deprecated('Use authLogoutRequestDescriptor instead')
const AuthLogoutRequest$json = {
  '1': 'AuthLogoutRequest',
};

/// Descriptor for `AuthLogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authLogoutRequestDescriptor = $convert.base64Decode(
    'ChFBdXRoTG9nb3V0UmVxdWVzdA==');

@$core.Deprecated('Use authLogoutResponseDescriptor instead')
const AuthLogoutResponse$json = {
  '1': 'AuthLogoutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AuthLogoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authLogoutResponseDescriptor = $convert.base64Decode(
    'ChJBdXRoTG9nb3V0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

