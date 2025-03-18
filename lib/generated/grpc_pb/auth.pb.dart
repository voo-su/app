//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthLoginRequest extends $pb.GeneratedMessage {
  factory AuthLoginRequest({
    $core.String? email,
    $core.String? platform,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (platform != null) {
      $result.platform = platform;
    }
    return $result;
  }
  AuthLoginRequest._() : super();
  factory AuthLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthLoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'platform')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthLoginRequest clone() => AuthLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthLoginRequest copyWith(void Function(AuthLoginRequest) updates) => super.copyWith((message) => updates(message as AuthLoginRequest)) as AuthLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthLoginRequest create() => AuthLoginRequest._();
  AuthLoginRequest createEmptyInstance() => create();
  static $pb.PbList<AuthLoginRequest> createRepeated() => $pb.PbList<AuthLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthLoginRequest>(create);
  static AuthLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get platform => $_getSZ(1);
  @$pb.TagNumber(2)
  set platform($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlatform() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlatform() => clearField(2);
}

class AuthLoginResponse extends $pb.GeneratedMessage {
  factory AuthLoginResponse({
    $core.String? token,
    $fixnum.Int64? expiresIn,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    return $result;
  }
  AuthLoginResponse._() : super();
  factory AuthLoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthLoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthLoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aInt64(2, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthLoginResponse clone() => AuthLoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthLoginResponse copyWith(void Function(AuthLoginResponse) updates) => super.copyWith((message) => updates(message as AuthLoginResponse)) as AuthLoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthLoginResponse create() => AuthLoginResponse._();
  AuthLoginResponse createEmptyInstance() => create();
  static $pb.PbList<AuthLoginResponse> createRepeated() => $pb.PbList<AuthLoginResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthLoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthLoginResponse>(create);
  static AuthLoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get expiresIn => $_getI64(1);
  @$pb.TagNumber(2)
  set expiresIn($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiresIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresIn() => clearField(2);
}

class AuthVerifyRequest extends $pb.GeneratedMessage {
  factory AuthVerifyRequest({
    $core.String? token,
    $core.String? code,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  AuthVerifyRequest._() : super();
  factory AuthVerifyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthVerifyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthVerifyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthVerifyRequest clone() => AuthVerifyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthVerifyRequest copyWith(void Function(AuthVerifyRequest) updates) => super.copyWith((message) => updates(message as AuthVerifyRequest)) as AuthVerifyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthVerifyRequest create() => AuthVerifyRequest._();
  AuthVerifyRequest createEmptyInstance() => create();
  static $pb.PbList<AuthVerifyRequest> createRepeated() => $pb.PbList<AuthVerifyRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthVerifyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthVerifyRequest>(create);
  static AuthVerifyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class AuthVerifyResponse extends $pb.GeneratedMessage {
  factory AuthVerifyResponse({
    $core.String? type,
    $core.String? accessToken,
    $fixnum.Int64? expiresIn,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (expiresIn != null) {
      $result.expiresIn = expiresIn;
    }
    return $result;
  }
  AuthVerifyResponse._() : super();
  factory AuthVerifyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthVerifyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthVerifyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'accessToken')
    ..aInt64(3, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthVerifyResponse clone() => AuthVerifyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthVerifyResponse copyWith(void Function(AuthVerifyResponse) updates) => super.copyWith((message) => updates(message as AuthVerifyResponse)) as AuthVerifyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthVerifyResponse create() => AuthVerifyResponse._();
  AuthVerifyResponse createEmptyInstance() => create();
  static $pb.PbList<AuthVerifyResponse> createRepeated() => $pb.PbList<AuthVerifyResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthVerifyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthVerifyResponse>(create);
  static AuthVerifyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accessToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set accessToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccessToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessToken() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get expiresIn => $_getI64(2);
  @$pb.TagNumber(3)
  set expiresIn($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => clearField(3);
}

class AuthLogoutRequest extends $pb.GeneratedMessage {
  factory AuthLogoutRequest() => create();
  AuthLogoutRequest._() : super();
  factory AuthLogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthLogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthLogoutRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthLogoutRequest clone() => AuthLogoutRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthLogoutRequest copyWith(void Function(AuthLogoutRequest) updates) => super.copyWith((message) => updates(message as AuthLogoutRequest)) as AuthLogoutRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthLogoutRequest create() => AuthLogoutRequest._();
  AuthLogoutRequest createEmptyInstance() => create();
  static $pb.PbList<AuthLogoutRequest> createRepeated() => $pb.PbList<AuthLogoutRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthLogoutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthLogoutRequest>(create);
  static AuthLogoutRequest? _defaultInstance;
}

class AuthLogoutResponse extends $pb.GeneratedMessage {
  factory AuthLogoutResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AuthLogoutResponse._() : super();
  factory AuthLogoutResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthLogoutResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthLogoutResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'auth'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthLogoutResponse clone() => AuthLogoutResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthLogoutResponse copyWith(void Function(AuthLogoutResponse) updates) => super.copyWith((message) => updates(message as AuthLogoutResponse)) as AuthLogoutResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthLogoutResponse create() => AuthLogoutResponse._();
  AuthLogoutResponse createEmptyInstance() => create();
  static $pb.PbList<AuthLogoutResponse> createRepeated() => $pb.PbList<AuthLogoutResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthLogoutResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthLogoutResponse>(create);
  static AuthLogoutResponse? _defaultInstance;

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
