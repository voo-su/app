part of 'group_bloc.dart';

abstract class GroupState extends Equatable {
  const GroupState();
}

class GroupInitialState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupCreatingState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupCreatedState extends GroupState {
  final int groupId;

  const GroupCreatedState({required this.groupId});

  @override
  List<Object> get props => [groupId];
}

class GroupErrorState extends GroupState {
  final Failure failure;

  const GroupErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}

class GroupInfoLoadingState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupInfoLoadedState extends GroupState {
  final String name;
  final String avatar;
  final List<Contact> members;

  const GroupInfoLoadedState({
    required this.name,
    required this.avatar,
    required this.members,
  });

  @override
  List<Object> get props => [name, avatar, members];
}

class GroupInfoErrorState extends GroupState {
  final Failure failure;

  const GroupInfoErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}

class GroupAddingMembersState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupMembersAddedState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupLeavingState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupLeftState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupMembersRemovedState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupDeletingState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupDeletedState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupUpdatingState extends GroupState {
  @override
  List<Object> get props => [];
}

class GroupUpdatedState extends GroupState {
  @override
  List<Object> get props => [];
}
