// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'person_model.dart';

class PhysicalPersonModel extends PersonModel {
  final String cpf;
  final DateTime birthAt;

  PhysicalPersonModel({
    required this.cpf,
    required this.birthAt,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  @override
  String toString() {
    return 'PersonModel(name: $name, address: $address, telephone: $telephone, accounts: $accounts, cpf: $cpf, birthAt: $birthAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'telephone': telephone,
      'accounts': accounts.map((account) => account.toJson()).toList(),
      'cpf': cpf,
      // 'birthAt': birthAt,
    };
  }
}
