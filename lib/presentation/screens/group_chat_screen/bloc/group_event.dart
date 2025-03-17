part of 'group_bloc.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();
}

class CreateGroupEvent extends GroupEvent {
  final String name;
  final List<int> memberIds;

  const CreateGroupEvent({required this.name, this.memberIds = const []});

  @override
  List<Object> get props => [name, memberIds];
}

class LoadGroupInfoEvent extends GroupEvent {
  final int groupId;

  const LoadGroupInfoEvent(this.groupId);

  @override
  List<Object> get props => [groupId];
}

class AddUserToGroupChatEvent extends GroupEvent {
  final int groupId;
  final List<int> memberIds;

  const AddUserToGroupChatEvent({required this.groupId, required this.memberIds});

  @override
  List<Object> get props => [groupId, memberIds];
}
