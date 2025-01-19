import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/domain/entities/contact.dart';

abstract class ContactRepository {
  Future<Either<Failure, ContactResponse>> getContacts(ContactParams params);
}
