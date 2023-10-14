import 'package:aula_1/models/account/account_model.dart';

abstract class PersonModel {
  final String name;
  final String surname;
  final String address;
  final String phone;
  final List<AccountModel> accounts;

  PersonModel({
    required this.name,
    required this.surname,
    required this.address,
    required this.phone,
    required this.accounts,
  });

  String toPrint() {
    return 'Nome: $name \nSobrenome: $surname \nEndereço: $address \nTelefone: $phone';
  }
}
