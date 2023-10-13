import 'package:aula_1/helper/constants/constants.dart';
import 'package:aula_1/models/persons/legal_person_model.dart';
import 'package:aula_1/models/persons/person_model.dart';
import 'package:aula_1/models/persons/person_type.dart';
import 'package:aula_1/models/persons/physical_person_model.dart';
import 'package:aula_1/models/user_model.dart';

import '../helper/readers/read_int.dart';
import '../helper/readers/read_string.dart';

class UserController {
  UserModel getUser() {
    print(messageSignUp);
    final email = readString('Qual seu email? ');
    final password = readNumberAsString('Qual sua senha? ');

    final person = _getPerson();

    final prompt = person is PhysicalPersonModel
        ? signUpLegalPerson
        : signUpPhysicalPerson;

    final person2 = readInt(prompt, 2) == 1
        ? _getPerson(
            type: person is PhysicalPersonModel
                ? PersonType.legal
                : PersonType.physical,
          )
        : null;

    final user = UserModel(
      id: 1,
      email: email,
      password: password,
      createdAt: DateTime.now(),
      persons: [person],
    );

    if (person2 != null) {
      user.persons.add(person2);
    }
    return user;
  }

  PersonModel _getPerson({PersonType? type}) {
    final personType = _getPersonType(type);

    if (personType == PersonType.physical) {
      final name = readString('Qual seu nome? ');
      final surname = readString('Qual seu sobrenome? ');
      final birthAt = readString('Qual sua data de nascimento? ');
      final address = readString('Qual seu endereço? ');
      final phone = readNumberAsString('Qual seu telefone? ');
      final cpf = readNumberAsString('Qual seu CPF? ');
      final personModel = PhysicalPersonModel(
        surname: surname,
        birthAt: birthAt,
        address: address,
        phone: phone,
        name: name,
        accounts: [],
        cpf: cpf,
      );
      return personModel;
    } else {
      final name = readString('Qual o nome fantasia? ');
      final surname = readString('Qual a razão social da empresa? ');
      final address = readString('Qual o endereço? ');
      final phone = readNumberAsString('Qual o telefone? ');
      final cnpj = readNumberAsString('Qual seu CNPJ? ');
      final personModel = LegalPersonModel(
        surname: surname,
        address: address,
        phone: phone,
        name: name,
        accounts: [],
        cnpj: cnpj,
      );
      return personModel;
    }
  }

  PersonType _getPersonType(PersonType? type) {
    if (type != null) {
      return type;
    }
    while (true) {
      int personType = readInt(choosePersonType, 2);

      switch (personType) {
        case 2:
          return PersonType.legal;

        default:
          return PersonType.physical;
      }
    }
  }
}