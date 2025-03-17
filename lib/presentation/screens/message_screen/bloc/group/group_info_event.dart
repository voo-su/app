part of 'group_info_bloc.dart';

abstract class GroupInfoEvent extends Equatable {
  const GroupInfoEvent();
}

class LoadGroupInfoEvent extends GroupInfoEvent {
  final int groupId;

  const LoadGroupInfoEvent(this.groupId);

  @override
  List<Object> get props => [groupId];
}
