//
//  Generated code. Do not modify.
//  source: upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class SaveFilePartRequest extends $pb.GeneratedMessage {
  factory SaveFilePartRequest({
    $fixnum.Int64? fileId,
    $core.int? filePart,
    $core.List<$core.int>? bytes,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (filePart != null) {
      $result.filePart = filePart;
    }
    if (bytes != null) {
      $result.bytes = bytes;
    }
    return $result;
  }
  SaveFilePartRequest._() : super();
  factory SaveFilePartRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveFilePartRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SaveFilePartRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'upload'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'fileId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'filePart', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'bytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveFilePartRequest clone() => SaveFilePartRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveFilePartRequest copyWith(void Function(SaveFilePartRequest) updates) => super.copyWith((message) => updates(message as SaveFilePartRequest)) as SaveFilePartRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveFilePartRequest create() => SaveFilePartRequest._();
  SaveFilePartRequest createEmptyInstance() => create();
  static $pb.PbList<SaveFilePartRequest> createRepeated() => $pb.PbList<SaveFilePartRequest>();
  @$core.pragma('dart2js:noInline')
  static SaveFilePartRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveFilePartRequest>(create);
  static SaveFilePartRequest? _defaultInstance;

  /// Unique file id (the same for all parts of a single file)
  @$pb.TagNumber(1)
  $fixnum.Int64 get fileId => $_getI64(0);
  @$pb.TagNumber(1)
  set fileId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  /// File part number (starting from 0)
  @$pb.TagNumber(2)
  $core.int get filePart => $_getIZ(1);
  @$pb.TagNumber(2)
  set filePart($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilePart() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilePart() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get bytes => $_getN(2);
  @$pb.TagNumber(3)
  set bytes($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearBytes() => clearField(3);
}

class SaveFilePartResponse extends $pb.GeneratedMessage {
  factory SaveFilePartResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  SaveFilePartResponse._() : super();
  factory SaveFilePartResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveFilePartResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SaveFilePartResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'upload'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveFilePartResponse clone() => SaveFilePartResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveFilePartResponse copyWith(void Function(SaveFilePartResponse) updates) => super.copyWith((message) => updates(message as SaveFilePartResponse)) as SaveFilePartResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveFilePartResponse create() => SaveFilePartResponse._();
  SaveFilePartResponse createEmptyInstance() => create();
  static $pb.PbList<SaveFilePartResponse> createRepeated() => $pb.PbList<SaveFilePartResponse>();
  @$core.pragma('dart2js:noInline')
  static SaveFilePartResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveFilePartResponse>(create);
  static SaveFilePartResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
