import 'package:aula_1/models/persons/person_model.dart';

class PhysicalPersonModel extends PersonModel {
  final String cpf;
  final String birthAt;

  PhysicalPersonModel({
    required this.cpf,
    required this.birthAt,
    required super.name,
    required super.surname,
    required super.address,
    required super.phone,
    required super.accounts,
  });

  @override
  String toPrint() {
    String parent = super.toPrint();
    return '$parent \nCPF: $cpf';
  }
}
