import 'package:aula_1/models/persons/person_model.dart';

class LegalPersonModel extends PersonModel {
  final String cnpj;

  LegalPersonModel({
    required this.cnpj,
    required super.id,
    required super.name,
    required super.surname,
    required super.address,
    required super.phone,
    required super.createdAt,
    required super.contas,
  });

  @override
  String toPrint() {
    String parent = super.toPrint();
    return '$parent \nCNPJ: $cnpj';
  }
}
