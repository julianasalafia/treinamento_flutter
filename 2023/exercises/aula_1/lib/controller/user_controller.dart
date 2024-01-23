import 'package:aula_1/controller/person_controller.dart';
import 'package:aula_1/helper/constants/constants.dart';
import 'package:aula_1/models/person/person_model.dart';
import 'package:aula_1/models/person/person_type.dart';
import 'package:aula_1/models/person/physical_person_model.dart';
import 'package:aula_1/models/user_model.dart';

import '../helper/readers/read_int.dart';
import '../helper/readers/read_string.dart';

class UserController {
  UserModel getUser() {
    PersonController personController = PersonController();
    print(messageSignUp);
    final email = readString(askEmail);
    final password = readNumberAsString(askPassword);

    final personFirst = personController.getPerson();

    final prompt = personFirst is PhysicalPersonModel
        ? signUpLegalPerson
        : signUpPhysicalPerson;

    // final personSecondType = readInt(prompt, 2) == 1
    //     ? personController.getPerson(
    //         type: personFirstType is PhysicalPersonModel
    //             ? PersonType.legal
    //             : PersonType.physical,
    //       )
    //     : null;

    PersonModel? personSecond;

    final physicalPersonIsCreated = personFirst is PhysicalPersonModel;
    final personSecondType = readInt(prompt, 2);

    if (personSecondType == 1) {
      var personType = PersonType.physical;

      if (physicalPersonIsCreated) personType = PersonType.legal;
      personSecond = personController.getPerson(type: personType);
    }

    final user = UserModel(
      id: 1,
      email: email,
      password: password,
      createdAt: DateTime.now(),
      persons: [personFirst],
    );

    if (personSecond != null) {
      user.persons.add(personSecond);
    }
    return user;
  }
}
