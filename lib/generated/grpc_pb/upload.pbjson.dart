//
//  Generated code. Do not modify.
//  source: upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use saveFilePartRequestDescriptor instead')
const SaveFilePartRequest$json = {
  '1': 'SaveFilePartRequest',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 3, '10': 'fileId'},
    {'1': 'file_part', '3': 2, '4': 1, '5': 5, '10': 'filePart'},
    {'1': 'bytes', '3': 3, '4': 1, '5': 12, '10': 'bytes'},
  ],
};

/// Descriptor for `SaveFilePartRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveFilePartRequestDescriptor = $convert.base64Decode(
    'ChNTYXZlRmlsZVBhcnRSZXF1ZXN0EhcKB2ZpbGVfaWQYASABKANSBmZpbGVJZBIbCglmaWxlX3'
    'BhcnQYAiABKAVSCGZpbGVQYXJ0EhQKBWJ5dGVzGAMgASgMUgVieXRlcw==');

@$core.Deprecated('Use saveFilePartResponseDescriptor instead')
const SaveFilePartResponse$json = {
  '1': 'SaveFilePartResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SaveFilePartResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveFilePartResponseDescriptor = $convert.base64Decode(
    'ChRTYXZlRmlsZVBhcnRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

