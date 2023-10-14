import '../helper/constants/constants.dart';
import '../helper/readers/read_int.dart';
import '../helper/readers/read_string.dart';
import '../models/person/legal_person_model.dart';
import '../models/person/person_model.dart';
import '../models/person/person_type.dart';
import '../models/person/physical_person_model.dart';

class PersonController {
  PersonModel getPerson({PersonType? type}) {
    final personType = _getPersonType(type);

    if (personType == PersonType.physical) {
      final name = readString(askName);
      final surname = readString(askSurname);
      final birthAt = readString(askBirthAt);
      final address = readString(askAddress);
      final phone = readNumberAsString(askPhoneNumber);
      final cpf = readNumberAsString(askCPF);
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
      final name = readString(askCompanyName);
      final surname = readString(askCompanyDocName);
      final address = readString(askAddress);
      final phone = readNumberAsString(askPhoneNumber);
      final cnpj = readNumberAsString(askCNPJ);
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
