// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../accounts/account_model.dart';

abstract class PersonModel {
  final String name;
  final String address;
  final String telephone;
  final List<AccountModel> accounts;

  PersonModel({
    required this.name,
    required this.address,
    required this.telephone,
    required this.accounts,
  });

  Map<String, dynamic> toJson();
}
