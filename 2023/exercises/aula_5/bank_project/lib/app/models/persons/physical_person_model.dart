import 'package:bank_project/app/models/accounts/account_factory.dart';
import 'package:bank_project/app/models/accounts/account_model.dart';

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

  factory PhysicalPersonModel.fromJson(Map<String, dynamic> json) {
    final accounts = <AccountModel>[];

    for (var account in json['accounts']) {
      final accountJson = AccountFactory.fromJson(account);
      accounts.add(accountJson);
    }

    return PhysicalPersonModel(
      cpf: json['cpf'],
      birthAt: json['birthAt'],
      name: json['name'],
      address: json['address'],
      telephone: json['telephone'],
      accounts: accounts,
    );
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
