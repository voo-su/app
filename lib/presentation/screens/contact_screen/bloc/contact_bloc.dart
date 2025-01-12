import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/usecases/contact/get_contacts_usecase.dart';

part 'contact_event.dart';

part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUseCase _getContactsUseCase;

  ContactBloc(this._getContactsUseCase) : super(InitialState()) {
    on<ContactEvent>(_onLoadContacts);
  }

  void _onLoadContacts(ContactEvent event, Emitter<ContactState> emit) async {
    try {
      emit(LoadingState());
      final result = await _getContactsUseCase(event.params);
      result.fold(
        (failure) => emit(ErrorState(failure: failure)),
        (success) => emit(SuccessState(contacts: success.contacts)),
      );
    } catch (e) {
      emit(ErrorState(failure: ExceptionFailure()));
    }
  }
}
