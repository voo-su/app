import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pb.dart';
import 'package:voo_su/domain/entities/account.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/usecases/account/get_acccount_usecase.dart';
import 'package:voo_su/domain/usecases/account/get_notify_settings_usecase.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetAccountUseCase _getAccountUseCase;
  final GetNotifySettingsUseCase _getNotifySettingsUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  SettingsBloc(
    this._getAccountUseCase,
    this._getNotifySettingsUseCase,
    this._updateProfileUseCase,
  ) : super(SettingsInitialState()) {
    on<GetAccountEvent>(_onGetAccount);
    on<GetNotifySettingsEvent>(_onGetNotifySettings);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onGetAccount(
    GetAccountEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoadingState());
      final result = await _getAccountUseCase(AccountParams());

      result.fold(
        (failure) => emit(SettingsErrorState(failure: failure)),
        (success) => emit(SettingsSuccessState(account: success.account)),
      );
    } catch (e) {
      emit(SettingsErrorState(failure: ExceptionFailure()));
    }
  }

  Future<void> _onGetNotifySettings(
    GetNotifySettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoadingState());

      final chatsResult = await _getNotifySettingsUseCase(
        NotifyEntity(groups: EntityGroups()),
      );
      final groupsResult = await _getNotifySettingsUseCase(
        NotifyEntity(chats: EntityChats()),
      );

      chatsResult.fold(
        (failure) => emit(SettingsErrorState(failure: failure)),
        (chatsSettings) {
          groupsResult.fold(
            (failure) => emit(SettingsErrorState(failure: failure)),
            (groupsSettings) {
              emit(
                SettingsNotifySettingsState(
                  privateChatsSettings: chatsSettings,
                  groupChatsSettings: groupsSettings,
                ),
              );
            },
          );
        },
      );
    } catch (e) {
      emit(SettingsErrorState(failure: ExceptionFailure()));
    }
  }

    Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoadingState());

      final result = await _updateProfileUseCase(event.params);

      result.fold(
        (failure) => emit(SettingsErrorState(failure: failure)),
        (success) => emit(SettingsProfileUpdatedState(success: success)),
      );
    } catch (e) {
      emit(SettingsErrorState(failure: ExceptionFailure()));
    }
  }
}
