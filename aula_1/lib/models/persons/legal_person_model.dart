import 'package:aula_1/models/persons/person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.name,
    required super.surname,
    required super.address,
    required super.phone,
    required super.accounts,
  });

  @override
  String toPrint() {
    String parent = super.toPrint();
    return '$parent \nCNPJ: $cnpj';
  }
}
