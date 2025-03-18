//
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $0;

export 'account.pb.dart';

@$pb.GrpcServiceName('account.AccountService')
class AccountServiceClient extends $grpc.Client {
  static final _$getProfile = $grpc.ClientMethod<$0.GetProfileRequest, $0.GetProfileResponse>(
      '/account.AccountService/GetProfile',
      ($0.GetProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetProfileResponse.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
      '/account.AccountService/UpdateProfile',
      ($0.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateProfileResponse.fromBuffer(value));
  static final _$updateProfilePhoto = $grpc.ClientMethod<$0.UpdateProfilePhotoRequest, $0.UpdateProfilePhotoResponse>(
      '/account.AccountService/UpdateProfilePhoto',
      ($0.UpdateProfilePhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateProfilePhotoResponse.fromBuffer(value));
  static final _$getNotifySettings = $grpc.ClientMethod<$0.GetNotifySettingsRequest, $0.GetNotifySettingsResponse>(
      '/account.AccountService/GetNotifySettings',
      ($0.GetNotifySettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetNotifySettingsResponse.fromBuffer(value));
  static final _$updateNotifySettings = $grpc.ClientMethod<$0.UpdateNotifySettingsRequest, $0.UpdateNotifySettingsResponse>(
      '/account.AccountService/UpdateNotifySettings',
      ($0.UpdateNotifySettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateNotifySettingsResponse.fromBuffer(value));
  static final _$registerDevice = $grpc.ClientMethod<$0.RegisterDeviceRequest, $0.RegisterDeviceResponse>(
      '/account.AccountService/RegisterDevice',
      ($0.RegisterDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RegisterDeviceResponse.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetProfileResponse> getProfile($0.GetProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProfileResponse> updateProfile($0.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProfilePhotoResponse> updateProfilePhoto($0.UpdateProfilePhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfilePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetNotifySettingsResponse> getNotifySettings($0.GetNotifySettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotifySettings, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateNotifySettingsResponse> updateNotifySettings($0.UpdateNotifySettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNotifySettings, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterDeviceResponse> registerDevice($0.RegisterDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('account.AccountService')
abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'account.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetProfileRequest, $0.GetProfileResponse>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProfileRequest.fromBuffer(value),
        ($0.GetProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateProfileRequest.fromBuffer(value),
        ($0.UpdateProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProfilePhotoRequest, $0.UpdateProfilePhotoResponse>(
        'UpdateProfilePhoto',
        updateProfilePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateProfilePhotoRequest.fromBuffer(value),
        ($0.UpdateProfilePhotoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNotifySettingsRequest, $0.GetNotifySettingsResponse>(
        'GetNotifySettings',
        getNotifySettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetNotifySettingsRequest.fromBuffer(value),
        ($0.GetNotifySettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateNotifySettingsRequest, $0.UpdateNotifySettingsResponse>(
        'UpdateNotifySettings',
        updateNotifySettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateNotifySettingsRequest.fromBuffer(value),
        ($0.UpdateNotifySettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterDeviceRequest, $0.RegisterDeviceResponse>(
        'RegisterDevice',
        registerDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterDeviceRequest.fromBuffer(value),
        ($0.RegisterDeviceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetProfileResponse> getProfile_Pre($grpc.ServiceCall call, $async.Future<$0.GetProfileRequest> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$0.UpdateProfileResponse> updateProfile_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$0.UpdateProfilePhotoResponse> updateProfilePhoto_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateProfilePhotoRequest> request) async {
    return updateProfilePhoto(call, await request);
  }

  $async.Future<$0.GetNotifySettingsResponse> getNotifySettings_Pre($grpc.ServiceCall call, $async.Future<$0.GetNotifySettingsRequest> request) async {
    return getNotifySettings(call, await request);
  }

  $async.Future<$0.UpdateNotifySettingsResponse> updateNotifySettings_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateNotifySettingsRequest> request) async {
    return updateNotifySettings(call, await request);
  }

  $async.Future<$0.RegisterDeviceResponse> registerDevice_Pre($grpc.ServiceCall call, $async.Future<$0.RegisterDeviceRequest> request) async {
    return registerDevice(call, await request);
  }

  $async.Future<$0.GetProfileResponse> getProfile($grpc.ServiceCall call, $0.GetProfileRequest request);
  $async.Future<$0.UpdateProfileResponse> updateProfile($grpc.ServiceCall call, $0.UpdateProfileRequest request);
  $async.Future<$0.UpdateProfilePhotoResponse> updateProfilePhoto($grpc.ServiceCall call, $0.UpdateProfilePhotoRequest request);
  $async.Future<$0.GetNotifySettingsResponse> getNotifySettings($grpc.ServiceCall call, $0.GetNotifySettingsRequest request);
  $async.Future<$0.UpdateNotifySettingsResponse> updateNotifySettings($grpc.ServiceCall call, $0.UpdateNotifySettingsRequest request);
  $async.Future<$0.RegisterDeviceResponse> registerDevice($grpc.ServiceCall call, $0.RegisterDeviceRequest request);
}
