import '../helpers/datetime_extension.dart';
import '../helpers/helpers.dart';
import '../helpers/person_type.dart';
import '../models/persons/legal_person_model.dart';
import '../models/persons/person_model.dart';
import '../models/persons/physical_person_model.dart';
import '../utils/console.dart';
import '../utils/messages.dart';

class PersonController {
  static PersonModel create() {
    Console.write(Messages.choosePersonType);

    final personTypeSelectedCode = Console.readInt();
    final personType = PersonType.fromCode(personTypeSelectedCode);

    late final PersonModel person;

    final id = Helpers.generateID();
    final createdAt = DateTime.now();

    switch (personType) {
      case PersonType.physical:
        final name = Console.writeAndRead('Digite seu nome: ');
        final telephone = Console.writeAndRead('Digite seu telefone: ');
        final address = Console.writeAndRead('Digite seu endereço: ');
        final cpf = Console.writeAndRead('Digite seu cpf: ');
        final birthAt = Console.writeAndRead('Digite sua data de nascimento: ');

        person = PhysicalPersonModel(
          cpf: cpf,
          birthAt: parseDate(birthAt),
          id: id,
          name: name,
          address: address,
          telephone: telephone,
          createdAt: createdAt,
          accounts: [],
        );
      case PersonType.legal:
        final name = Console.writeAndRead('Digite o nome fantasia: ');
        final telephone = Console.writeAndRead('Digite seu telefone: ');
        final address = Console.writeAndRead('Digite seu endereço: ');
        final cnpj = Console.writeAndRead('Digite seu cnpj: ');

        person = LegalPersonModel(
          cnpj: cnpj,
          id: id,
          name: name,
          address: address,
          telephone: telephone,
          createdAt: createdAt,
          accounts: [],
        );
    }

    return person;
  }
}
