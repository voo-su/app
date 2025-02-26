import 'package:voo_su/domain/entities/chat_update.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';

class GetUpdates {
  final ChatRepository repository;

  GetUpdates(this.repository);

  Future<Stream<ChatUpdate>> call() {
    return repository.getUpdates();
  }
}
