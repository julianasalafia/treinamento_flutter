import 'package:dart_project/models/persons/person_model.dart';

import 'card_model.dart';

class DebitCardModel extends CardModel {
  DebitCardModel({
    required super.person,
    required super.cardNumber,
    required super.cvv,
    required super.flag,
    required super.expirationDate,
  });

  factory DebitCardModel.create({required PersonModel person}) {
    return DebitCardModel(
      person: person,
      cardNumber: CardModel.generateCardNumber(),
      cvv: CardModel.generateCVV(),
      flag: CardFlag.generateFlag(),
      expirationDate: DateTime.now().add(Duration(days: 1825)),
    );
  }
}
