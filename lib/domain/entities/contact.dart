import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int id;
  final String username;
  final String name;
  final String surname;
  final String avatar;

  const Contact({
    required this.id,
    required this.username,
    required this.name,
    required this.surname,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id];
}

class ContactResponse {
  final List<Contact> contacts;

  ContactResponse({required this.contacts});
}

class FilterContactParams {
  const FilterContactParams();
}
