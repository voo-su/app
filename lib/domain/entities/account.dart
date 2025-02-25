import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final int id;
  final String avatar;
  final String username;
  final String email;
  final String name;
  final String surname;
  final int gender;
  final String birthday;
  final String about;

  const Account({
    required this.id,
    required this.avatar,
    required this.username,
    required this.email,
    required this.name,
    required this.surname,
    required this.gender,
    required this.birthday,
    required this.about,
  });

  @override
  List<Object?> get props => [id, username, email];
}

class AccountResponse {
  final Account account;

  AccountResponse({required this.account});
}

class AccountParams {
  const AccountParams();
}
