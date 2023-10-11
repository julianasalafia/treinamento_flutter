import 'package:aula_1/models/persons/person_model.dart';

class PhysicalPersonModel extends PersonModel {
  final String cpf;
  final DateTime birthAt;

  PhysicalPersonModel({
    required this.cpf,
    required this.birthAt,
    required super.id,
    required super.name,
    required super.address,
    required super.phone,
    required super.createdAt,
    required super.contas,
  });
}
