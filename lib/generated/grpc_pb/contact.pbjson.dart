//
//  Generated code. Do not modify.
//  source: contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getContactsRequestDescriptor instead')
const GetContactsRequest$json = {
  '1': 'GetContactsRequest',
};

/// Descriptor for `GetContactsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRDb250YWN0c1JlcXVlc3Q=');

@$core.Deprecated('Use getContactsResponseDescriptor instead')
const GetContactsResponse$json = {
  '1': 'GetContactsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.contact.ContactItem', '10': 'items'},
  ],
};

/// Descriptor for `GetContactsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRDb250YWN0c1Jlc3BvbnNlEioKBWl0ZW1zGAEgAygLMhQuY29udGFjdC5Db250YWN0SX'
    'RlbVIFaXRlbXM=');

@$core.Deprecated('Use contactItemDescriptor instead')
const ContactItem$json = {
  '1': 'ContactItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 4, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'avatar', '3': 5, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `ContactItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactItemDescriptor = $convert.base64Decode(
    'CgtDb250YWN0SXRlbRIOCgJpZBgBIAEoA1ICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW'
    '1lEhIKBG5hbWUYAyABKAlSBG5hbWUSGAoHc3VybmFtZRgEIAEoCVIHc3VybmFtZRIWCgZhdmF0'
    'YXIYBSABKAlSBmF2YXRhcg==');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    {'1': 'avatar', '3': 3, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'gender', '3': 6, '4': 1, '5': 5, '10': 'gender'},
    {'1': 'about', '3': 7, '4': 1, '5': 9, '10': 'about'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USDgoCaWQYASABKANSAmlkEhoKCHVzZXJuYW1lGAIgASgJUgh1c2'
    'VybmFtZRIWCgZhdmF0YXIYAyABKAlSBmF2YXRhchISCgRuYW1lGAQgASgJUgRuYW1lEhgKB3N1'
    'cm5hbWUYBSABKAlSB3N1cm5hbWUSFgoGZ2VuZGVyGAYgASgFUgZnZW5kZXISFAoFYWJvdXQYBy'
    'ABKAlSBWFib3V0');

@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = {
  '1': 'SearchRequest',
  '2': [
    {'1': 'q', '3': 1, '4': 1, '5': 9, '10': 'q'},
    {'1': 'limit', '3': 2, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode(
    'Cg1TZWFyY2hSZXF1ZXN0EgwKAXEYASABKAlSAXESFAoFbGltaXQYAiABKANSBWxpbWl0');

@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse$json = {
  '1': 'SearchResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.contact.ContactItem', '10': 'items'},
  ],
};

/// Descriptor for `SearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResponseDescriptor = $convert.base64Decode(
    'Cg5TZWFyY2hSZXNwb25zZRIqCgVpdGVtcxgBIAMoCzIULmNvbnRhY3QuQ29udGFjdEl0ZW1SBW'
    'l0ZW1z');

