import 'package:aula_1/controller/card_controller.dart';
import 'package:aula_1/controller/user_controller.dart';
import 'package:aula_1/helper/readers/read_int.dart';
import 'package:aula_1/models/menu/operations_menu.dart';
import 'package:aula_1/models/person/legal_person_model.dart';
import 'package:aula_1/models/person/physical_person_model.dart';
import 'helper/constants/constants.dart';

void main() {
  OperationsMenu operationsMenu = OperationsMenu.nenhum;
  final userController = UserController();
  final cardController = CardController();
  final user = userController.getUser();

  final name = user.persons.map((e) => e.name).toList();

  welcomeMessage(name.first);
  operationsMenu = operationsMenu.menuOptions();

  if (operationsMenu != OperationsMenu.carteira) {
    print(serviceUnavailable);
  }

  if (operationsMenu == OperationsMenu.carteira) {
    if (readInt(newCard, 2) == 1) {
      if (user.persons.length == 1) {
        cardController.getCard(user.persons.first);
      } else {
        final chosenAccount = readInt(physicalOrLegalPerson, 2);

        final accountSelected =
            chosenAccount == 1 ? PhysicalPersonModel : LegalPersonModel;

        final personSelected = user.persons.firstWhere(
            (person) => person.runtimeType == accountSelected.runtimeType);
        cardController.getCard(personSelected);
      }
    }
  }
}

void welcomeMessage(String name) {
  print('$welcome $name');
}
