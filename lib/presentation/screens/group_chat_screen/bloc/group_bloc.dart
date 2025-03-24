import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/entities/group.dart';
import 'package:voo_su/domain/usecases/group/add_user_group_usecase.dart';
import 'package:voo_su/domain/usecases/group/create_group_chat_usecase.dart';
import 'package:voo_su/domain/usecases/group/delete_group_usecase.dart';
import 'package:voo_su/domain/usecases/group/edit_group_description_usecase.dart';
import 'package:voo_su/domain/usecases/group/edit_group_name_usecase.dart';
import 'package:voo_su/domain/usecases/group/get_group_chat_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_members_usecase.dart';
import 'package:voo_su/domain/usecases/group/leave_group_usecase.dart';
import 'package:voo_su/domain/usecases/group/remove_user_group_usecase.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final CreateGroupChatUseCase _createGroupChatUseCase;
  final AddUserGroupUseCase _addUserGroupChatUseCase;
  final GetGroupChatUseCase _getGroupChatUseCase;
  final GetMembersUseCase _getMembersUseCase;
  final LeaveGroupUseCase _leaveGroupUseCase;
  final RemoveUserGroupUseCase _removeUserGroupUseCase;
  final DeleteGroupUsecase _deleteGroupUsecase;
  final EditGroupNameUseCase _editGroupNameUseCase;
  final EditGroupDescriptionUseCase _editGroupDescriptionUseCase;

  GroupBloc(
    this._createGroupChatUseCase,
    this._addUserGroupChatUseCase,
    this._getGroupChatUseCase,
    this._getMembersUseCase,
    this._leaveGroupUseCase,
    this._removeUserGroupUseCase,
    this._deleteGroupUsecase,
    this._editGroupDescriptionUseCase,
    this._editGroupNameUseCase,
  ) : super(GroupInitialState()) {
    on<CreateGroupEvent>(_onCreateGroup);
    on<AddUserToGroupChatEvent>(_onAddUserToGroupChat);
    on<LoadGroupInfoEvent>(_onLoadGroupInfo);
    on<LeaveGroupChatEvent>(_onLeaveGroupChat);
    on<RemoveUserFromGroupChatEvent>(_onRemoveUserFromGroupChat);
    on<DeleteGroupEvent>(_onDeleteGroup);
    on<UpdateGroupNameEvent>(_onEditGroupName);
    on<EditGroupDescriptionEvent>(_onEditGroupDescription);
  }

  Future<void> _onCreateGroup(
    CreateGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupCreatingState());

      final result = await _createGroupChatUseCase(
        CreateGroupChatParams(name: event.name),
      );

      result.fold((failure) => emit(GroupErrorState(failure)), (group) async {
        final groupId = group.id.toInt();
        emit(GroupCreatedState(groupId: groupId));

        if (event.memberIds.isNotEmpty) {
          add(
            AddUserToGroupChatEvent(
              groupId: groupId,
              memberIds: event.memberIds,
            ),
          );
        }
      });
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onAddUserToGroupChat(
    AddUserToGroupChatEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupAddingMembersState());

      final result = await _addUserGroupChatUseCase(
        AddUserParams(id: event.groupId, userIds: event.memberIds),
      );

      result.fold((failure) => emit(GroupErrorState(failure)), (_) {
        emit(GroupMembersAddedState());
      });
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onLoadGroupInfo(
    LoadGroupInfoEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupInfoLoadingState());

      final groupResult = await _getGroupChatUseCase(event.groupId);
      final membersResult = await _getMembersUseCase(event.groupId);

      groupResult.fold((failure) => emit(GroupInfoErrorState(failure)), (
        group,
      ) {
        membersResult.fold((failure) => emit(GroupInfoErrorState(failure)), (
          members,
        ) {
          emit(
            GroupInfoLoadedState(
              name: group.name,
              avatar: group.avatar,
              members:
                  members.items
                      .map(
                        (item) => Contact(
                          id: item.id.toInt(),
                          username: item.username,
                          avatar: item.avatar,
                          name: item.name,
                          surname: item.surname,
                        ),
                      )
                      .toList(),
            ),
          );
        });
      });
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onLeaveGroupChat(
    LeaveGroupChatEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupLeavingState());

      final result = await _leaveGroupUseCase(event.groupId);

      result.fold(
        (failure) => emit(GroupErrorState(failure)),
        (_) => emit(GroupLeftState()),
      );
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onRemoveUserFromGroupChat(
    RemoveUserFromGroupChatEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupRemovingMemberState());

      final result = await _removeUserGroupUseCase(
        RemoveUserParams(id: event.groupId, userId: event.memberId),
      );

      result.fold(
        (failure) => emit(GroupErrorState(failure)),
        (_) => emit(GroupMembersRemovedState()),
      );
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onDeleteGroup(
    DeleteGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupDeletingState());

      final result = await _deleteGroupUsecase(event.groupId);

      result.fold(
        (failure) => emit(GroupErrorState(failure)),
        (_) => emit(GroupDeletedState()),
      );
    } catch (e) {
      emit(GroupErrorState(ExceptionFailure()));
    }
  }

  Future<void> _onEditGroupName(
    UpdateGroupNameEvent event,
    Emitter<GroupState> emit,
  ) async {
    emit(GroupUpdatingState());

    final result = await _editGroupNameUseCase(
      EditGroupNameParams(groupId: event.groupId, newName: event.updatedName),
    );

    result.fold(
      (failure) => emit(GroupErrorState(failure)),
      (_) => emit(GroupUpdatedState()),
    );
  }

  Future<void> _onEditGroupDescription(
    EditGroupDescriptionEvent event,
    Emitter<GroupState> emit,
  ) async {
    emit(GroupUpdatingState());

    final result = await _editGroupDescriptionUseCase(
      EditGroupDescriptionParams(
        groupId: event.groupId,
        newDescription: event.newDescription,
      ),
    );

    result.fold(
      (failure) => emit(GroupErrorState(failure)),
      (_) => emit(GroupUpdatedState()),
    );
  }
}
