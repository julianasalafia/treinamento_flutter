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

class PersonController with Console {
  PersonModel create() {
    write(Messages.choosePersonType);

    final personTypeSelectedCode = readInt();
    final personType = PersonType.fromCode(personTypeSelectedCode);

    late final PersonModel person;

    switch (personType) {
      case PersonType.physical:
        final name =
            writeAndReadWithValidator(Messages.typeCompleteName, validateName);

        final telephone = writeAndReadWithValidator(
            Messages.typePhoneNumber, validateTelephone);

        final address =
            writeAndReadWithValidator(Messages.typeAddress, validateAddress);

        final cpf = writeAndReadWithValidator(Messages.typeCpf, validateCPF);
        final birthAt =
            writeAndReadWithValidator(Messages.typeBirthAt, validateBirthAt);

        person = PhysicalPersonModel(
          cpf: cpf,
          birthAt: parseDate(birthAt),
          name: name,
          address: address,
          telephone: telephone,
          accounts: [],
        );
      case PersonType.legal:
        final name =
            writeAndReadWithValidator(Messages.typeCompanyName, validateName);
        final telephone = writeAndReadWithValidator(
            Messages.typePhoneNumber, validateTelephone);
        final address =
            writeAndReadWithValidator(Messages.typeAddress, validateAddress);
        final cnpj = writeAndReadWithValidator(Messages.typeCnpj, validateCNPJ);

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
