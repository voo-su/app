//
//  Generated code. Do not modify.
//  source: common/common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class InputFile extends $pb.GeneratedMessage {
  factory InputFile({
    $fixnum.Int64? id,
    $core.int? parts,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (parts != null) {
      $result.parts = parts;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  InputFile._() : super();
  factory InputFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InputFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'common'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'parts', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InputFile clone() => InputFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InputFile copyWith(void Function(InputFile) updates) => super.copyWith((message) => updates(message as InputFile)) as InputFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputFile create() => InputFile._();
  InputFile createEmptyInstance() => create();
  static $pb.PbList<InputFile> createRepeated() => $pb.PbList<InputFile>();
  @$core.pragma('dart2js:noInline')
  static InputFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputFile>(create);
  static InputFile? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get parts => $_getIZ(1);
  @$pb.TagNumber(2)
  set parts($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParts() => $_has(1);
  @$pb.TagNumber(2)
  void clearParts() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class EntityNotifySettings extends $pb.GeneratedMessage {
  factory EntityNotifySettings({
    $core.int? muteUntil,
    $core.bool? silent,
    $core.bool? showPreviews,
  }) {
    final $result = create();
    if (muteUntil != null) {
      $result.muteUntil = muteUntil;
    }
    if (silent != null) {
      $result.silent = silent;
    }
    if (showPreviews != null) {
      $result.showPreviews = showPreviews;
    }
    return $result;
  }
  EntityNotifySettings._() : super();
  factory EntityNotifySettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityNotifySettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityNotifySettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'muteUntil', $pb.PbFieldType.O3)
    ..aOB(2, _omitFieldNames ? '' : 'silent')
    ..aOB(3, _omitFieldNames ? '' : 'showPreviews')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityNotifySettings clone() => EntityNotifySettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityNotifySettings copyWith(void Function(EntityNotifySettings) updates) => super.copyWith((message) => updates(message as EntityNotifySettings)) as EntityNotifySettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityNotifySettings create() => EntityNotifySettings._();
  EntityNotifySettings createEmptyInstance() => create();
  static $pb.PbList<EntityNotifySettings> createRepeated() => $pb.PbList<EntityNotifySettings>();
  @$core.pragma('dart2js:noInline')
  static EntityNotifySettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityNotifySettings>(create);
  static EntityNotifySettings? _defaultInstance;

  /// Time until notifications are disabled (Unix timestamp)
  /// If mute_until = 0, notifications are enabled
  /// If mute_until > current time, notifications are disabled until the specified time
  /// If mute_until = 2147483647, notifications are disabled permanently
  @$pb.TagNumber(1)
  $core.int get muteUntil => $_getIZ(0);
  @$pb.TagNumber(1)
  set muteUntil($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMuteUntil() => $_has(0);
  @$pb.TagNumber(1)
  void clearMuteUntil() => clearField(1);

  /// Mute notifications sound flag
  /// If silent = true, notifications arrive without sound
  /// If silent = false, notifications arrive with sound
  @$pb.TagNumber(2)
  $core.bool get silent => $_getBF(1);
  @$pb.TagNumber(2)
  set silent($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSilent() => $_has(1);
  @$pb.TagNumber(2)
  void clearSilent() => clearField(2);

  /// Message preview display flag
  /// If show_previews = true, the message text is displayed in the notification
  /// If show_previews = false, only the sender's name is shown in the notification
  @$pb.TagNumber(3)
  $core.bool get showPreviews => $_getBF(2);
  @$pb.TagNumber(3)
  set showPreviews($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShowPreviews() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowPreviews() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
