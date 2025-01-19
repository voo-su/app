import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/repositories/contact_repository.dart';

class GetContactsUseCase implements UseCase<ContactResponse, ContactParams> {
  final ContactRepository repository;

  GetContactsUseCase(this.repository);

  @override
  Future<Either<Failure, ContactResponse>> call(ContactParams params) async {
    return await repository.getContacts(params);
  }
}
