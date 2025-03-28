//
//  Generated code. Do not modify.
//  source: group_chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common/common.pb.dart' as $6;

class CreateGroupChatRequest extends $pb.GeneratedMessage {
  factory CreateGroupChatRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  CreateGroupChatRequest._() : super();
  factory CreateGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGroupChatRequest clone() => CreateGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGroupChatRequest copyWith(void Function(CreateGroupChatRequest) updates) => super.copyWith((message) => updates(message as CreateGroupChatRequest)) as CreateGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupChatRequest create() => CreateGroupChatRequest._();
  CreateGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGroupChatRequest> createRepeated() => $pb.PbList<CreateGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGroupChatRequest>(create);
  static CreateGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateGroupChatResponse extends $pb.GeneratedMessage {
  factory CreateGroupChatResponse({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  CreateGroupChatResponse._() : super();
  factory CreateGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateGroupChatResponse clone() => CreateGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateGroupChatResponse copyWith(void Function(CreateGroupChatResponse) updates) => super.copyWith((message) => updates(message as CreateGroupChatResponse)) as CreateGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGroupChatResponse create() => CreateGroupChatResponse._();
  CreateGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<CreateGroupChatResponse> createRepeated() => $pb.PbList<CreateGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGroupChatResponse>(create);
  static CreateGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetGroupChatRequest extends $pb.GeneratedMessage {
  factory GetGroupChatRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetGroupChatRequest._() : super();
  factory GetGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGroupChatRequest clone() => GetGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGroupChatRequest copyWith(void Function(GetGroupChatRequest) updates) => super.copyWith((message) => updates(message as GetGroupChatRequest)) as GetGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGroupChatRequest create() => GetGroupChatRequest._();
  GetGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<GetGroupChatRequest> createRepeated() => $pb.PbList<GetGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGroupChatRequest>(create);
  static GetGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetGroupChatResponse extends $pb.GeneratedMessage {
  factory GetGroupChatResponse({
    $fixnum.Int64? id,
    $core.String? name,
    $core.String? about,
    $core.String? avatar,
    $fixnum.Int64? members,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (about != null) {
      $result.about = about;
    }
    if (avatar != null) {
      $result.avatar = avatar;
    }
    if (members != null) {
      $result.members = members;
    }
    return $result;
  }
  GetGroupChatResponse._() : super();
  factory GetGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'about')
    ..aOS(4, _omitFieldNames ? '' : 'avatar')
    ..aInt64(5, _omitFieldNames ? '' : 'members')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGroupChatResponse clone() => GetGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGroupChatResponse copyWith(void Function(GetGroupChatResponse) updates) => super.copyWith((message) => updates(message as GetGroupChatResponse)) as GetGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGroupChatResponse create() => GetGroupChatResponse._();
  GetGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<GetGroupChatResponse> createRepeated() => $pb.PbList<GetGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGroupChatResponse>(create);
  static GetGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get about => $_getSZ(2);
  @$pb.TagNumber(3)
  set about($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbout() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbout() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatar => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatar($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get members => $_getI64(4);
  @$pb.TagNumber(5)
  set members($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMembers() => $_has(4);
  @$pb.TagNumber(5)
  void clearMembers() => clearField(5);
}

class GetMembersRequest extends $pb.GeneratedMessage {
  factory GetMembersRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetMembersRequest._() : super();
  factory GetMembersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMembersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMembersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMembersRequest clone() => GetMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMembersRequest copyWith(void Function(GetMembersRequest) updates) => super.copyWith((message) => updates(message as GetMembersRequest)) as GetMembersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMembersRequest create() => GetMembersRequest._();
  GetMembersRequest createEmptyInstance() => create();
  static $pb.PbList<GetMembersRequest> createRepeated() => $pb.PbList<GetMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMembersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMembersRequest>(create);
  static GetMembersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetMembersResponse extends $pb.GeneratedMessage {
  factory GetMembersResponse({
    $core.Iterable<MemberItem>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  GetMembersResponse._() : super();
  factory GetMembersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMembersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMembersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..pc<MemberItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: MemberItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMembersResponse clone() => GetMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMembersResponse copyWith(void Function(GetMembersResponse) updates) => super.copyWith((message) => updates(message as GetMembersResponse)) as GetMembersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMembersResponse create() => GetMembersResponse._();
  GetMembersResponse createEmptyInstance() => create();
  static $pb.PbList<GetMembersResponse> createRepeated() => $pb.PbList<GetMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMembersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMembersResponse>(create);
  static GetMembersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MemberItem> get items => $_getList(0);
}

class MemberItem extends $pb.GeneratedMessage {
  factory MemberItem({
    $fixnum.Int64? id,
    $core.String? username,
    $core.String? avatar,
    $core.String? name,
    $core.String? surname,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (username != null) {
      $result.username = username;
    }
    if (avatar != null) {
      $result.avatar = avatar;
    }
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    return $result;
  }
  MemberItem._() : super();
  factory MemberItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'username')
    ..aOS(3, _omitFieldNames ? '' : 'avatar')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'surname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberItem clone() => MemberItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberItem copyWith(void Function(MemberItem) updates) => super.copyWith((message) => updates(message as MemberItem)) as MemberItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberItem create() => MemberItem._();
  MemberItem createEmptyInstance() => create();
  static $pb.PbList<MemberItem> createRepeated() => $pb.PbList<MemberItem>();
  @$core.pragma('dart2js:noInline')
  static MemberItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberItem>(create);
  static MemberItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(4);
  @$pb.TagNumber(5)
  set surname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurname() => clearField(5);
}

class AddUserToGroupChatRequest extends $pb.GeneratedMessage {
  factory AddUserToGroupChatRequest({
    $fixnum.Int64? id,
    $core.Iterable<$fixnum.Int64>? userIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userIds != null) {
      $result.userIds.addAll(userIds);
    }
    return $result;
  }
  AddUserToGroupChatRequest._() : super();
  factory AddUserToGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'userIds', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserToGroupChatRequest clone() => AddUserToGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserToGroupChatRequest copyWith(void Function(AddUserToGroupChatRequest) updates) => super.copyWith((message) => updates(message as AddUserToGroupChatRequest)) as AddUserToGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToGroupChatRequest create() => AddUserToGroupChatRequest._();
  AddUserToGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserToGroupChatRequest> createRepeated() => $pb.PbList<AddUserToGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserToGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserToGroupChatRequest>(create);
  static AddUserToGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get userIds => $_getList(1);
}

class AddUserToGroupChatResponse extends $pb.GeneratedMessage {
  factory AddUserToGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AddUserToGroupChatResponse._() : super();
  factory AddUserToGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserToGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserToGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserToGroupChatResponse clone() => AddUserToGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserToGroupChatResponse copyWith(void Function(AddUserToGroupChatResponse) updates) => super.copyWith((message) => updates(message as AddUserToGroupChatResponse)) as AddUserToGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserToGroupChatResponse create() => AddUserToGroupChatResponse._();
  AddUserToGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<AddUserToGroupChatResponse> createRepeated() => $pb.PbList<AddUserToGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static AddUserToGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserToGroupChatResponse>(create);
  static AddUserToGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RemoveUserFromGroupChatRequest extends $pb.GeneratedMessage {
  factory RemoveUserFromGroupChatRequest({
    $fixnum.Int64? id,
    $fixnum.Int64? userId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  RemoveUserFromGroupChatRequest._() : super();
  factory RemoveUserFromGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupChatRequest clone() => RemoveUserFromGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupChatRequest copyWith(void Function(RemoveUserFromGroupChatRequest) updates) => super.copyWith((message) => updates(message as RemoveUserFromGroupChatRequest)) as RemoveUserFromGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupChatRequest create() => RemoveUserFromGroupChatRequest._();
  RemoveUserFromGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromGroupChatRequest> createRepeated() => $pb.PbList<RemoveUserFromGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromGroupChatRequest>(create);
  static RemoveUserFromGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class RemoveUserFromGroupChatResponse extends $pb.GeneratedMessage {
  factory RemoveUserFromGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RemoveUserFromGroupChatResponse._() : super();
  factory RemoveUserFromGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserFromGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserFromGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupChatResponse clone() => RemoveUserFromGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserFromGroupChatResponse copyWith(void Function(RemoveUserFromGroupChatResponse) updates) => super.copyWith((message) => updates(message as RemoveUserFromGroupChatResponse)) as RemoveUserFromGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupChatResponse create() => RemoveUserFromGroupChatResponse._();
  RemoveUserFromGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveUserFromGroupChatResponse> createRepeated() => $pb.PbList<RemoveUserFromGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserFromGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserFromGroupChatResponse>(create);
  static RemoveUserFromGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class LeaveGroupChatRequest extends $pb.GeneratedMessage {
  factory LeaveGroupChatRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  LeaveGroupChatRequest._() : super();
  factory LeaveGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveGroupChatRequest clone() => LeaveGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveGroupChatRequest copyWith(void Function(LeaveGroupChatRequest) updates) => super.copyWith((message) => updates(message as LeaveGroupChatRequest)) as LeaveGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveGroupChatRequest create() => LeaveGroupChatRequest._();
  LeaveGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveGroupChatRequest> createRepeated() => $pb.PbList<LeaveGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveGroupChatRequest>(create);
  static LeaveGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class LeaveGroupChatResponse extends $pb.GeneratedMessage {
  factory LeaveGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  LeaveGroupChatResponse._() : super();
  factory LeaveGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LeaveGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveGroupChatResponse clone() => LeaveGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveGroupChatResponse copyWith(void Function(LeaveGroupChatResponse) updates) => super.copyWith((message) => updates(message as LeaveGroupChatResponse)) as LeaveGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LeaveGroupChatResponse create() => LeaveGroupChatResponse._();
  LeaveGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<LeaveGroupChatResponse> createRepeated() => $pb.PbList<LeaveGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static LeaveGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveGroupChatResponse>(create);
  static LeaveGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class DeleteGroupChatRequest extends $pb.GeneratedMessage {
  factory DeleteGroupChatRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteGroupChatRequest._() : super();
  factory DeleteGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGroupChatRequest clone() => DeleteGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGroupChatRequest copyWith(void Function(DeleteGroupChatRequest) updates) => super.copyWith((message) => updates(message as DeleteGroupChatRequest)) as DeleteGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGroupChatRequest create() => DeleteGroupChatRequest._();
  DeleteGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteGroupChatRequest> createRepeated() => $pb.PbList<DeleteGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGroupChatRequest>(create);
  static DeleteGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeleteGroupChatResponse extends $pb.GeneratedMessage {
  factory DeleteGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteGroupChatResponse._() : super();
  factory DeleteGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteGroupChatResponse clone() => DeleteGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteGroupChatResponse copyWith(void Function(DeleteGroupChatResponse) updates) => super.copyWith((message) => updates(message as DeleteGroupChatResponse)) as DeleteGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGroupChatResponse create() => DeleteGroupChatResponse._();
  DeleteGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteGroupChatResponse> createRepeated() => $pb.PbList<DeleteGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGroupChatResponse>(create);
  static DeleteGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class EditNameGroupChatRequest extends $pb.GeneratedMessage {
  factory EditNameGroupChatRequest({
    $fixnum.Int64? id,
    $core.String? name,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  EditNameGroupChatRequest._() : super();
  factory EditNameGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditNameGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditNameGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditNameGroupChatRequest clone() => EditNameGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditNameGroupChatRequest copyWith(void Function(EditNameGroupChatRequest) updates) => super.copyWith((message) => updates(message as EditNameGroupChatRequest)) as EditNameGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditNameGroupChatRequest create() => EditNameGroupChatRequest._();
  EditNameGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<EditNameGroupChatRequest> createRepeated() => $pb.PbList<EditNameGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static EditNameGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditNameGroupChatRequest>(create);
  static EditNameGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class EditNameGroupChatResponse extends $pb.GeneratedMessage {
  factory EditNameGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  EditNameGroupChatResponse._() : super();
  factory EditNameGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditNameGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditNameGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditNameGroupChatResponse clone() => EditNameGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditNameGroupChatResponse copyWith(void Function(EditNameGroupChatResponse) updates) => super.copyWith((message) => updates(message as EditNameGroupChatResponse)) as EditNameGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditNameGroupChatResponse create() => EditNameGroupChatResponse._();
  EditNameGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<EditNameGroupChatResponse> createRepeated() => $pb.PbList<EditNameGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static EditNameGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditNameGroupChatResponse>(create);
  static EditNameGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class EditAboutGroupChatRequest extends $pb.GeneratedMessage {
  factory EditAboutGroupChatRequest({
    $fixnum.Int64? id,
    $core.String? about,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (about != null) {
      $result.about = about;
    }
    return $result;
  }
  EditAboutGroupChatRequest._() : super();
  factory EditAboutGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditAboutGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditAboutGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'about')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditAboutGroupChatRequest clone() => EditAboutGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditAboutGroupChatRequest copyWith(void Function(EditAboutGroupChatRequest) updates) => super.copyWith((message) => updates(message as EditAboutGroupChatRequest)) as EditAboutGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditAboutGroupChatRequest create() => EditAboutGroupChatRequest._();
  EditAboutGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<EditAboutGroupChatRequest> createRepeated() => $pb.PbList<EditAboutGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static EditAboutGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditAboutGroupChatRequest>(create);
  static EditAboutGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get about => $_getSZ(1);
  @$pb.TagNumber(2)
  set about($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAbout() => $_has(1);
  @$pb.TagNumber(2)
  void clearAbout() => clearField(2);
}

class EditAboutGroupChatResponse extends $pb.GeneratedMessage {
  factory EditAboutGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  EditAboutGroupChatResponse._() : super();
  factory EditAboutGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditAboutGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditAboutGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditAboutGroupChatResponse clone() => EditAboutGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditAboutGroupChatResponse copyWith(void Function(EditAboutGroupChatResponse) updates) => super.copyWith((message) => updates(message as EditAboutGroupChatResponse)) as EditAboutGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditAboutGroupChatResponse create() => EditAboutGroupChatResponse._();
  EditAboutGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<EditAboutGroupChatResponse> createRepeated() => $pb.PbList<EditAboutGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static EditAboutGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditAboutGroupChatResponse>(create);
  static EditAboutGroupChatResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class EditPhotoGroupChatRequest extends $pb.GeneratedMessage {
  factory EditPhotoGroupChatRequest({
    $fixnum.Int64? id,
    $6.InputPhoto? photo,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (photo != null) {
      $result.photo = photo;
    }
    return $result;
  }
  EditPhotoGroupChatRequest._() : super();
  factory EditPhotoGroupChatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditPhotoGroupChatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditPhotoGroupChatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOM<$6.InputPhoto>(2, _omitFieldNames ? '' : 'photo', subBuilder: $6.InputPhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditPhotoGroupChatRequest clone() => EditPhotoGroupChatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditPhotoGroupChatRequest copyWith(void Function(EditPhotoGroupChatRequest) updates) => super.copyWith((message) => updates(message as EditPhotoGroupChatRequest)) as EditPhotoGroupChatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditPhotoGroupChatRequest create() => EditPhotoGroupChatRequest._();
  EditPhotoGroupChatRequest createEmptyInstance() => create();
  static $pb.PbList<EditPhotoGroupChatRequest> createRepeated() => $pb.PbList<EditPhotoGroupChatRequest>();
  @$core.pragma('dart2js:noInline')
  static EditPhotoGroupChatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditPhotoGroupChatRequest>(create);
  static EditPhotoGroupChatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $6.InputPhoto get photo => $_getN(1);
  @$pb.TagNumber(2)
  set photo($6.InputPhoto v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhoto() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhoto() => clearField(2);
  @$pb.TagNumber(2)
  $6.InputPhoto ensurePhoto() => $_ensure(1);
}

class EditPhotoGroupChatResponse extends $pb.GeneratedMessage {
  factory EditPhotoGroupChatResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  EditPhotoGroupChatResponse._() : super();
  factory EditPhotoGroupChatResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditPhotoGroupChatResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditPhotoGroupChatResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'group_chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditPhotoGroupChatResponse clone() => EditPhotoGroupChatResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditPhotoGroupChatResponse copyWith(void Function(EditPhotoGroupChatResponse) updates) => super.copyWith((message) => updates(message as EditPhotoGroupChatResponse)) as EditPhotoGroupChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditPhotoGroupChatResponse create() => EditPhotoGroupChatResponse._();
  EditPhotoGroupChatResponse createEmptyInstance() => create();
  static $pb.PbList<EditPhotoGroupChatResponse> createRepeated() => $pb.PbList<EditPhotoGroupChatResponse>();
  @$core.pragma('dart2js:noInline')
  static EditPhotoGroupChatResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditPhotoGroupChatResponse>(create);
  static EditPhotoGroupChatResponse? _defaultInstance;

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
