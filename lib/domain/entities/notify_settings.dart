import 'package:equatable/equatable.dart';

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
