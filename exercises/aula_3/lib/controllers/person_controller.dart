import 'package:dart_project/validators/validate_address.dart';
import 'package:dart_project/validators/validate_birthAt.dart';
import 'package:dart_project/validators/validate_cnpj.dart';
import 'package:dart_project/validators/validate_cpf.dart';
import 'package:dart_project/validators/validate_telephone.dart';

import '../helpers/datetime_extension.dart';
import '../helpers/person_type.dart';
import '../models/persons/legal_person_model.dart';
import '../models/persons/person_model.dart';
import '../models/persons/physical_person_model.dart';
import '../utils/console.dart';
import '../utils/messages.dart';
import '../validators/validate_name.dart';

class PersonController {
  PersonModel create() {
    Console.write(Messages.choosePersonType);

    final personTypeSelectedCode = Console.readInt();
    final personType = PersonType.fromCode(personTypeSelectedCode);

    late final PersonModel person;

    switch (personType) {
      case PersonType.physical:
        final name = Console.writeAndReadWithValidator(
            Messages.typeCompleteName, validateName);

        final telephone = Console.writeAndReadWithValidator(
            Messages.typePhoneNumber, validateTelephone);

        final address = Console.writeAndReadWithValidator(
            Messages.typeAddress, validateAddress);

        final cpf =
            Console.writeAndReadWithValidator(Messages.typeCpf, validateCPF);
        final birthAt = Console.writeAndReadWithValidator(
            Messages.typeBirthAt, validateBirthAt);

        person = PhysicalPersonModel(
          cpf: cpf,
          birthAt: parseDate(birthAt),
          name: name,
          address: address,
          telephone: telephone,
          accounts: [],
        );
      case PersonType.legal:
        final name = Console.writeAndReadWithValidator(
            Messages.typeCompanyName, validateName);
        final telephone = Console.writeAndReadWithValidator(
            Messages.typePhoneNumber, validateTelephone);
        final address = Console.writeAndReadWithValidator(
            Messages.typeAddress, validateAddress);
        final cnpj =
            Console.writeAndReadWithValidator(Messages.typeCnpj, validateCNPJ);

        person = LegalPersonModel(
          cnpj: cnpj,
          name: name,
          address: address,
          telephone: telephone,
          accounts: [],
        );
    }

    return person;
  }
}
