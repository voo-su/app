import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/usecases/chat/get_group_chat_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_members_usecase.dart';

part 'group_info_event.dart';
part 'group_info_state.dart';

class GroupInfoBloc extends Bloc<GroupInfoEvent, GroupInfoState> {
  final GetGroupChatUseCase _getGroupChatUseCase;
  final GetMembersUseCase _getMembersUseCase;

  GroupInfoBloc(this._getGroupChatUseCase, this._getMembersUseCase)
      : super(GroupInfoInitial()) {
    on<LoadGroupInfoEvent>(_onLoadGroupInfo);
  }

  void _onLoadGroupInfo(
    LoadGroupInfoEvent event,
    Emitter<GroupInfoState> emit,
  ) async {
    try {
      emit(GroupInfoLoadingState());

      final groupResult = await _getGroupChatUseCase(event.groupId);
      final membersResult = await _getMembersUseCase(event.groupId);

      groupResult.fold(
        (failure) => emit(GroupInfoErrorState(failure)),
        (group) {
          membersResult.fold(
            (failure) => emit(GroupInfoErrorState(failure)),
            (members) {
              emit(
                GroupInfoLoadedState(
                  name: group.name,
                  avatar: group.avatar,
                  members: members.items
                      .map((item) => Contact(
                            id: item.id.toInt(),
                            username: item.username,
                            avatar: item.avatar,
                            name: item.name,
                            surname: item.surname,
                          ))
                      .toList(),
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(GroupInfoErrorState(ExceptionFailure()));
    }
  }
}
