import 'package:equatable/equatable.dart';
import 'package:voo_su/generated/grpc_pb/account.pb.dart';
import 'package:voo_su/generated/grpc_pb/common/common.pb.dart';

class NotifySettings extends Equatable {
  final int muteUntil;
  final bool silent;
  final bool showPreviews;

  const NotifySettings({
    required this.muteUntil,
    required this.silent,
    required this.showPreviews,
  });

  @override
  List<Object?> get props => [muteUntil, silent, showPreviews];
}

class UpdateNotifySettings {
  final NotifyEntity entity;
  final EntityNotifySettings settings;

  UpdateNotifySettings({required this.entity, required this.settings});
}
