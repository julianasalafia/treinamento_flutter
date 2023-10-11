import 'package:aula_1/models/account/account_model.dart';

abstract class PersonModel {
  final int id;
  final String name;
  final String surname;
  final String address;
  final String phone;
  final DateTime createdAt;
  final List<AccountModel> contas;

  PersonModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.contas,
  });

  String toPrint() {
    return 'Nome: $name \nSobrenome: $surname \nEndereço: $address \nTelefone: $phone';
  }
}
