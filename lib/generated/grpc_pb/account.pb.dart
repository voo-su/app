//
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class GetProfileRequest extends $pb.GeneratedMessage {
  factory GetProfileRequest() => create();
  GetProfileRequest._() : super();
  factory GetProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileRequest clone() => GetProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileRequest copyWith(void Function(GetProfileRequest) updates) => super.copyWith((message) => updates(message as GetProfileRequest)) as GetProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileRequest create() => GetProfileRequest._();
  GetProfileRequest createEmptyInstance() => create();
  static $pb.PbList<GetProfileRequest> createRepeated() => $pb.PbList<GetProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileRequest>(create);
  static GetProfileRequest? _defaultInstance;
}

class GetProfileResponse extends $pb.GeneratedMessage {
  factory GetProfileResponse({
    $fixnum.Int64? id,
    $core.String? avatar,
    $core.String? username,
    $core.String? email,
    $core.String? name,
    $core.String? surname,
    $core.int? gender,
    $core.String? birthday,
    $core.String? about,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (avatar != null) {
      $result.avatar = avatar;
    }
    if (username != null) {
      $result.username = username;
    }
    if (email != null) {
      $result.email = email;
    }
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (about != null) {
      $result.about = about;
    }
    return $result;
  }
  GetProfileResponse._() : super();
  factory GetProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'avatar')
    ..aOS(3, _omitFieldNames ? '' : 'username')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'surname')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'birthday')
    ..aOS(9, _omitFieldNames ? '' : 'about')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileResponse clone() => GetProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileResponse copyWith(void Function(GetProfileResponse) updates) => super.copyWith((message) => updates(message as GetProfileResponse)) as GetProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileResponse create() => GetProfileResponse._();
  GetProfileResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfileResponse> createRepeated() => $pb.PbList<GetProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileResponse>(create);
  static GetProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get avatar => $_getSZ(1);
  @$pb.TagNumber(2)
  set avatar($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get username => $_getSZ(2);
  @$pb.TagNumber(3)
  set username($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsername() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsername() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get surname => $_getSZ(5);
  @$pb.TagNumber(6)
  set surname($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSurname() => $_has(5);
  @$pb.TagNumber(6)
  void clearSurname() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get gender => $_getIZ(6);
  @$pb.TagNumber(7)
  set gender($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGender() => $_has(6);
  @$pb.TagNumber(7)
  void clearGender() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get birthday => $_getSZ(7);
  @$pb.TagNumber(8)
  set birthday($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBirthday() => $_has(7);
  @$pb.TagNumber(8)
  void clearBirthday() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get about => $_getSZ(8);
  @$pb.TagNumber(9)
  set about($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAbout() => $_has(8);
  @$pb.TagNumber(9)
  void clearAbout() => clearField(9);
}

class UpdateProfileRequest extends $pb.GeneratedMessage {
  factory UpdateProfileRequest({
    $core.String? name,
    $core.String? surname,
    $core.int? gender,
    $core.String? birthday,
    $core.String? about,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (about != null) {
      $result.about = about;
    }
    return $result;
  }
  UpdateProfileRequest._() : super();
  factory UpdateProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'surname')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'gender', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'birthday')
    ..aOS(5, _omitFieldNames ? '' : 'about')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileRequest clone() => UpdateProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfileRequest copyWith(void Function(UpdateProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateProfileRequest)) as UpdateProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest create() => UpdateProfileRequest._();
  UpdateProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileRequest> createRepeated() => $pb.PbList<UpdateProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileRequest>(create);
  static UpdateProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get surname => $_getSZ(1);
  @$pb.TagNumber(2)
  set surname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSurname() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurname() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get gender => $_getIZ(2);
  @$pb.TagNumber(3)
  set gender($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get birthday => $_getSZ(3);
  @$pb.TagNumber(4)
  set birthday($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBirthday() => $_has(3);
  @$pb.TagNumber(4)
  void clearBirthday() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get about => $_getSZ(4);
  @$pb.TagNumber(5)
  set about($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAbout() => $_has(4);
  @$pb.TagNumber(5)
  void clearAbout() => clearField(5);
}

class UpdateProfileResponse extends $pb.GeneratedMessage {
  factory UpdateProfileResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateProfileResponse._() : super();
  factory UpdateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileResponse clone() => UpdateProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfileResponse copyWith(void Function(UpdateProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateProfileResponse)) as UpdateProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse create() => UpdateProfileResponse._();
  UpdateProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileResponse> createRepeated() => $pb.PbList<UpdateProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileResponse>(create);
  static UpdateProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateProfilePhotoRequest extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoRequest({
    $core.List<$core.int>? photo,
  }) {
    final $result = create();
    if (photo != null) {
      $result.photo = photo;
    }
    return $result;
  }
  UpdateProfilePhotoRequest._() : super();
  factory UpdateProfilePhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'photo', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoRequest clone() => UpdateProfilePhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoRequest copyWith(void Function(UpdateProfilePhotoRequest) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoRequest)) as UpdateProfilePhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoRequest create() => UpdateProfilePhotoRequest._();
  UpdateProfilePhotoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoRequest> createRepeated() => $pb.PbList<UpdateProfilePhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoRequest>(create);
  static UpdateProfilePhotoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get photo => $_getN(0);
  @$pb.TagNumber(1)
  set photo($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhoto() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhoto() => clearField(1);
}

class UpdateProfilePhotoResponse extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateProfilePhotoResponse._() : super();
  factory UpdateProfilePhotoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoResponse clone() => UpdateProfilePhotoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoResponse copyWith(void Function(UpdateProfilePhotoResponse) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoResponse)) as UpdateProfilePhotoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoResponse create() => UpdateProfilePhotoResponse._();
  UpdateProfilePhotoResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoResponse> createRepeated() => $pb.PbList<UpdateProfilePhotoResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoResponse>(create);
  static UpdateProfilePhotoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityNotifySettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
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

enum NotifyEntity_Entity {
  groups, 
  chats, 
  chat, 
  group, 
  notSet
}

class NotifyEntity extends $pb.GeneratedMessage {
  factory NotifyEntity({
    EntityGroups? groups,
    EntityChats? chats,
    EntityChat? chat,
    EntityGroup? group,
  }) {
    final $result = create();
    if (groups != null) {
      $result.groups = groups;
    }
    if (chats != null) {
      $result.chats = chats;
    }
    if (chat != null) {
      $result.chat = chat;
    }
    if (group != null) {
      $result.group = group;
    }
    return $result;
  }
  NotifyEntity._() : super();
  factory NotifyEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifyEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NotifyEntity_Entity> _NotifyEntity_EntityByTag = {
    1 : NotifyEntity_Entity.groups,
    2 : NotifyEntity_Entity.chats,
    4 : NotifyEntity_Entity.chat,
    5 : NotifyEntity_Entity.group,
    0 : NotifyEntity_Entity.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotifyEntity', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..oo(0, [1, 2, 4, 5])
    ..aOM<EntityGroups>(1, _omitFieldNames ? '' : 'groups', subBuilder: EntityGroups.create)
    ..aOM<EntityChats>(2, _omitFieldNames ? '' : 'chats', subBuilder: EntityChats.create)
    ..aOM<EntityChat>(4, _omitFieldNames ? '' : 'chat', subBuilder: EntityChat.create)
    ..aOM<EntityGroup>(5, _omitFieldNames ? '' : 'group', subBuilder: EntityGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotifyEntity clone() => NotifyEntity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotifyEntity copyWith(void Function(NotifyEntity) updates) => super.copyWith((message) => updates(message as NotifyEntity)) as NotifyEntity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifyEntity create() => NotifyEntity._();
  NotifyEntity createEmptyInstance() => create();
  static $pb.PbList<NotifyEntity> createRepeated() => $pb.PbList<NotifyEntity>();
  @$core.pragma('dart2js:noInline')
  static NotifyEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifyEntity>(create);
  static NotifyEntity? _defaultInstance;

  NotifyEntity_Entity whichEntity() => _NotifyEntity_EntityByTag[$_whichOneof(0)]!;
  void clearEntity() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  EntityGroups get groups => $_getN(0);
  @$pb.TagNumber(1)
  set groups(EntityGroups v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroups() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroups() => clearField(1);
  @$pb.TagNumber(1)
  EntityGroups ensureGroups() => $_ensure(0);

  @$pb.TagNumber(2)
  EntityChats get chats => $_getN(1);
  @$pb.TagNumber(2)
  set chats(EntityChats v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChats() => $_has(1);
  @$pb.TagNumber(2)
  void clearChats() => clearField(2);
  @$pb.TagNumber(2)
  EntityChats ensureChats() => $_ensure(1);

  @$pb.TagNumber(4)
  EntityChat get chat => $_getN(2);
  @$pb.TagNumber(4)
  set chat(EntityChat v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasChat() => $_has(2);
  @$pb.TagNumber(4)
  void clearChat() => clearField(4);
  @$pb.TagNumber(4)
  EntityChat ensureChat() => $_ensure(2);

  @$pb.TagNumber(5)
  EntityGroup get group => $_getN(3);
  @$pb.TagNumber(5)
  set group(EntityGroup v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(3);
  @$pb.TagNumber(5)
  void clearGroup() => clearField(5);
  @$pb.TagNumber(5)
  EntityGroup ensureGroup() => $_ensure(3);
}

class EntityChats extends $pb.GeneratedMessage {
  factory EntityChats() => create();
  EntityChats._() : super();
  factory EntityChats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityChats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityChats', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityChats clone() => EntityChats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityChats copyWith(void Function(EntityChats) updates) => super.copyWith((message) => updates(message as EntityChats)) as EntityChats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityChats create() => EntityChats._();
  EntityChats createEmptyInstance() => create();
  static $pb.PbList<EntityChats> createRepeated() => $pb.PbList<EntityChats>();
  @$core.pragma('dart2js:noInline')
  static EntityChats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityChats>(create);
  static EntityChats? _defaultInstance;
}

class EntityGroups extends $pb.GeneratedMessage {
  factory EntityGroups() => create();
  EntityGroups._() : super();
  factory EntityGroups.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityGroups.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityGroups', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityGroups clone() => EntityGroups()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityGroups copyWith(void Function(EntityGroups) updates) => super.copyWith((message) => updates(message as EntityGroups)) as EntityGroups;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityGroups create() => EntityGroups._();
  EntityGroups createEmptyInstance() => create();
  static $pb.PbList<EntityGroups> createRepeated() => $pb.PbList<EntityGroups>();
  @$core.pragma('dart2js:noInline')
  static EntityGroups getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityGroups>(create);
  static EntityGroups? _defaultInstance;
}

class EntityChat extends $pb.GeneratedMessage {
  factory EntityChat({
    $fixnum.Int64? chatId,
  }) {
    final $result = create();
    if (chatId != null) {
      $result.chatId = chatId;
    }
    return $result;
  }
  EntityChat._() : super();
  factory EntityChat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityChat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityChat', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'chatId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityChat clone() => EntityChat()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityChat copyWith(void Function(EntityChat) updates) => super.copyWith((message) => updates(message as EntityChat)) as EntityChat;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityChat create() => EntityChat._();
  EntityChat createEmptyInstance() => create();
  static $pb.PbList<EntityChat> createRepeated() => $pb.PbList<EntityChat>();
  @$core.pragma('dart2js:noInline')
  static EntityChat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityChat>(create);
  static EntityChat? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatId() => clearField(1);
}

class EntityGroup extends $pb.GeneratedMessage {
  factory EntityGroup({
    $fixnum.Int64? groupId,
  }) {
    final $result = create();
    if (groupId != null) {
      $result.groupId = groupId;
    }
    return $result;
  }
  EntityGroup._() : super();
  factory EntityGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EntityGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'groupId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityGroup clone() => EntityGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityGroup copyWith(void Function(EntityGroup) updates) => super.copyWith((message) => updates(message as EntityGroup)) as EntityGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EntityGroup create() => EntityGroup._();
  EntityGroup createEmptyInstance() => create();
  static $pb.PbList<EntityGroup> createRepeated() => $pb.PbList<EntityGroup>();
  @$core.pragma('dart2js:noInline')
  static EntityGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityGroup>(create);
  static EntityGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get groupId => $_getI64(0);
  @$pb.TagNumber(1)
  set groupId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);
}

class GetNotifySettingsRequest extends $pb.GeneratedMessage {
  factory GetNotifySettingsRequest({
    NotifyEntity? entity,
  }) {
    final $result = create();
    if (entity != null) {
      $result.entity = entity;
    }
    return $result;
  }
  GetNotifySettingsRequest._() : super();
  factory GetNotifySettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotifySettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotifySettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOM<NotifyEntity>(1, _omitFieldNames ? '' : 'entity', subBuilder: NotifyEntity.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotifySettingsRequest clone() => GetNotifySettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotifySettingsRequest copyWith(void Function(GetNotifySettingsRequest) updates) => super.copyWith((message) => updates(message as GetNotifySettingsRequest)) as GetNotifySettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotifySettingsRequest create() => GetNotifySettingsRequest._();
  GetNotifySettingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotifySettingsRequest> createRepeated() => $pb.PbList<GetNotifySettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotifySettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotifySettingsRequest>(create);
  static GetNotifySettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  NotifyEntity get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity(NotifyEntity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  NotifyEntity ensureEntity() => $_ensure(0);
}

class GetNotifySettingsResponse extends $pb.GeneratedMessage {
  factory GetNotifySettingsResponse({
    EntityNotifySettings? settings,
  }) {
    final $result = create();
    if (settings != null) {
      $result.settings = settings;
    }
    return $result;
  }
  GetNotifySettingsResponse._() : super();
  factory GetNotifySettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotifySettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotifySettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOM<EntityNotifySettings>(1, _omitFieldNames ? '' : 'settings', subBuilder: EntityNotifySettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotifySettingsResponse clone() => GetNotifySettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotifySettingsResponse copyWith(void Function(GetNotifySettingsResponse) updates) => super.copyWith((message) => updates(message as GetNotifySettingsResponse)) as GetNotifySettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotifySettingsResponse create() => GetNotifySettingsResponse._();
  GetNotifySettingsResponse createEmptyInstance() => create();
  static $pb.PbList<GetNotifySettingsResponse> createRepeated() => $pb.PbList<GetNotifySettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNotifySettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotifySettingsResponse>(create);
  static GetNotifySettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  EntityNotifySettings get settings => $_getN(0);
  @$pb.TagNumber(1)
  set settings(EntityNotifySettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettings() => clearField(1);
  @$pb.TagNumber(1)
  EntityNotifySettings ensureSettings() => $_ensure(0);
}

class UpdateNotifySettingsRequest extends $pb.GeneratedMessage {
  factory UpdateNotifySettingsRequest({
    NotifyEntity? entity,
    EntityNotifySettings? settings,
  }) {
    final $result = create();
    if (entity != null) {
      $result.entity = entity;
    }
    if (settings != null) {
      $result.settings = settings;
    }
    return $result;
  }
  UpdateNotifySettingsRequest._() : super();
  factory UpdateNotifySettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotifySettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotifySettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOM<NotifyEntity>(1, _omitFieldNames ? '' : 'entity', subBuilder: NotifyEntity.create)
    ..aOM<EntityNotifySettings>(2, _omitFieldNames ? '' : 'settings', subBuilder: EntityNotifySettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotifySettingsRequest clone() => UpdateNotifySettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotifySettingsRequest copyWith(void Function(UpdateNotifySettingsRequest) updates) => super.copyWith((message) => updates(message as UpdateNotifySettingsRequest)) as UpdateNotifySettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotifySettingsRequest create() => UpdateNotifySettingsRequest._();
  UpdateNotifySettingsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateNotifySettingsRequest> createRepeated() => $pb.PbList<UpdateNotifySettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotifySettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotifySettingsRequest>(create);
  static UpdateNotifySettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  NotifyEntity get entity => $_getN(0);
  @$pb.TagNumber(1)
  set entity(NotifyEntity v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEntity() => $_has(0);
  @$pb.TagNumber(1)
  void clearEntity() => clearField(1);
  @$pb.TagNumber(1)
  NotifyEntity ensureEntity() => $_ensure(0);

  @$pb.TagNumber(2)
  EntityNotifySettings get settings => $_getN(1);
  @$pb.TagNumber(2)
  set settings(EntityNotifySettings v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearSettings() => clearField(2);
  @$pb.TagNumber(2)
  EntityNotifySettings ensureSettings() => $_ensure(1);
}

class UpdateNotifySettingsResponse extends $pb.GeneratedMessage {
  factory UpdateNotifySettingsResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateNotifySettingsResponse._() : super();
  factory UpdateNotifySettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotifySettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotifySettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotifySettingsResponse clone() => UpdateNotifySettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotifySettingsResponse copyWith(void Function(UpdateNotifySettingsResponse) updates) => super.copyWith((message) => updates(message as UpdateNotifySettingsResponse)) as UpdateNotifySettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotifySettingsResponse create() => UpdateNotifySettingsResponse._();
  UpdateNotifySettingsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNotifySettingsResponse> createRepeated() => $pb.PbList<UpdateNotifySettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotifySettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotifySettingsResponse>(create);
  static UpdateNotifySettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RegisterDeviceRequest extends $pb.GeneratedMessage {
  factory RegisterDeviceRequest({
    $core.int? tokenType,
    $core.String? token,
  }) {
    final $result = create();
    if (tokenType != null) {
      $result.tokenType = tokenType;
    }
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  RegisterDeviceRequest._() : super();
  factory RegisterDeviceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterDeviceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterDeviceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tokenType', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterDeviceRequest clone() => RegisterDeviceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterDeviceRequest copyWith(void Function(RegisterDeviceRequest) updates) => super.copyWith((message) => updates(message as RegisterDeviceRequest)) as RegisterDeviceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest create() => RegisterDeviceRequest._();
  RegisterDeviceRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterDeviceRequest> createRepeated() => $pb.PbList<RegisterDeviceRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterDeviceRequest>(create);
  static RegisterDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tokenType => $_getIZ(0);
  @$pb.TagNumber(1)
  set tokenType($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTokenType() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class RegisterDeviceResponse extends $pb.GeneratedMessage {
  factory RegisterDeviceResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RegisterDeviceResponse._() : super();
  factory RegisterDeviceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterDeviceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterDeviceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'account'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterDeviceResponse clone() => RegisterDeviceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterDeviceResponse copyWith(void Function(RegisterDeviceResponse) updates) => super.copyWith((message) => updates(message as RegisterDeviceResponse)) as RegisterDeviceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceResponse create() => RegisterDeviceResponse._();
  RegisterDeviceResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterDeviceResponse> createRepeated() => $pb.PbList<RegisterDeviceResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterDeviceResponse>(create);
  static RegisterDeviceResponse? _defaultInstance;

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
