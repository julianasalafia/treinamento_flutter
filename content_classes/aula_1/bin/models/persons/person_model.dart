import '../account/account_model.dart';

abstract class PersonModel {
  final int id;

  final String name;
  final String address;
  final String phone;
  final DateTime createdAt;
  final List<AccountModel> contas;

  PersonModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.contas,
  });
}
