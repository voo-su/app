import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/contact_remote_data_source.dart';
import 'package:voo_su/domain/entities/contact.dart';
import 'package:voo_su/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  ContactRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, ContactResponse>> getContacts(params) async {
    try {
      final response = await remoteDataSource.getContacts();

      return Right(
        ContactResponse(
          contacts: List.of(
            response.items.map(
              (item) => Contact(
                id: item.id.toInt(),
                username: item.username,
                name: item.name,
                surname: item.surname,
                avatar: item.avatar,
              ),
            ),
          ),
        ),
      );
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
