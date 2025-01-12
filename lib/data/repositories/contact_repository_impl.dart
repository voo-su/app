import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/contact_remote_data_source.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  ContactRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<Failure, ContactResponse>> getContacts(params) async {
    try {
      final String token = await localDataSource.getToken();
      final response = await remoteDataSource.list(token);

      List<Contact> contactList = response.items
          .map((item) => Contact(
                id: item.id,
                username: item.username,
                name: item.name,
                surname: item.surname,

                // TODO
                avatar: "",
              ))
          .toList();

      return Right(ContactResponse(contacts: contactList));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
