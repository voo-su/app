//
//  Generated code. Do not modify.
//  source: common/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

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

@$core.Deprecated('Use inputFileDescriptor instead')
const InputFile$json = {
  '1': 'InputFile',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'parts', '3': 2, '4': 1, '5': 5, '10': 'parts'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `InputFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputFileDescriptor = $convert.base64Decode(
    'CglJbnB1dEZpbGUSDgoCaWQYASABKANSAmlkEhQKBXBhcnRzGAIgASgFUgVwYXJ0cxISCgRuYW'
    '1lGAMgASgJUgRuYW1l');

@$core.Deprecated('Use inputDocumentFileLocationDescriptor instead')
const InputDocumentFileLocation$json = {
  '1': 'InputDocumentFileLocation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `InputDocumentFileLocation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputDocumentFileLocationDescriptor = $convert.base64Decode(
    'ChlJbnB1dERvY3VtZW50RmlsZUxvY2F0aW9uEg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use inputPhotoDescriptor instead')
const InputPhoto$json = {
  '1': 'InputPhoto',
  '2': [
    {'1': 'empty', '3': 1, '4': 1, '5': 11, '6': '.common.InputPhotoEmpty', '9': 0, '10': 'empty'},
    {'1': 'file', '3': 2, '4': 1, '5': 11, '6': '.common.InputFile', '9': 0, '10': 'file'},
  ],
  '8': [
    {'1': 'photo'},
  ],
};

/// Descriptor for `InputPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputPhotoDescriptor = $convert.base64Decode(
    'CgpJbnB1dFBob3RvEi8KBWVtcHR5GAEgASgLMhcuY29tbW9uLklucHV0UGhvdG9FbXB0eUgAUg'
    'VlbXB0eRInCgRmaWxlGAIgASgLMhEuY29tbW9uLklucHV0RmlsZUgAUgRmaWxlQgcKBXBob3Rv');

@$core.Deprecated('Use inputPhotoEmptyDescriptor instead')
const InputPhotoEmpty$json = {
  '1': 'InputPhotoEmpty',
};

/// Descriptor for `InputPhotoEmpty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputPhotoEmptyDescriptor = $convert.base64Decode(
    'Cg9JbnB1dFBob3RvRW1wdHk=');

