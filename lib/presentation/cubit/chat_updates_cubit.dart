import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class ChatUpdatesCubit extends Cubit<List<ChatUpdate>> {
  final ChatRepository repository;
  Stream<ChatUpdate>? _updatesStream;

  ChatUpdatesCubit(this.repository) : super([]) {
    _startListening();
  }

  Future<void> _startListening() async {
    print('<< VLog - _startListening >>');
    _updatesStream = await repository.getUpdates();
    _updatesStream!.listen((update) {
      emit([...state, update]);
    });
  }

  @override
  Future<void> close() {
    print('<< VLog - close >>');
    _updatesStream = null;
    return super.close();
  }
}
