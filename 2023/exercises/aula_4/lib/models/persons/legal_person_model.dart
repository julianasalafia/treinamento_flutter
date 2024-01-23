import 'person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.name,
    required super.address,
    required super.telephone,
    required super.accounts,
  });

  @override
  String toString() {
    return 'PersonModel(name: $name, address: $address, telephone: $telephone, accounts: $accounts, cnpj: $cnpj)';
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'telephone': telephone,
      'accounts': accounts.map((account) => account.toJson()).toList(),
      'cnpj': cnpj,
    };
  }
}
