part of 'group_info_bloc.dart';

abstract class GroupInfoState extends Equatable {
  const GroupInfoState();
}

class GroupInfoInitial extends GroupInfoState {
  @override
  List<Object> get props => [];
}

class GroupInfoLoadingState extends GroupInfoState {
  @override
  List<Object> get props => [];
}

class GroupInfoLoadedState extends GroupInfoState {
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

class GroupInfoErrorState extends GroupInfoState {
  final Failure failure;

  const GroupInfoErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
