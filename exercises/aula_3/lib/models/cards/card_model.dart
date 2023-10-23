import 'dart:math';

import '../../utils/labels.dart';
import '../persons/person_model.dart';

const maxSize = 4;

abstract class CardModel {
  final PersonModel person;
  final String cardNumber;
  final String cvv;
  final CardFlag flag;
  final DateTime expirationDate;

  CardModel({
    required this.person,
    required this.cardNumber,
    required this.cvv,
    required this.flag,
    required this.expirationDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'cardNumber': cardNumber,
      'cvv': cvv,
      'flag': flag.label,
      'expirationDate': expirationDate,
    };
  }

  static String generateCardNumber() {
    var random = Random();
    List<String> cardNumber = [];

    for (var i = 0; i < maxSize; ++i) {
      String group = '';
      for (var j = 0; j < maxSize; ++j) {
        group += random.nextInt(10).toString();
      }
      cardNumber.add(group);
    }

    return cardNumber.join(' ');
  }

  static String generateCVV() {
    final random = Random();

    int randomNumber = random.nextInt(999);
    return randomNumber.toString();
  }
}

enum CardFlag {
  masterCard(label: Labels.mastercard),
  visa(label: Labels.visa);

  final String label;
  const CardFlag({required this.label});

  static CardFlag generateFlag() {
    final random = Random();

    int randomNumber = random.nextInt(1);
    return CardFlag.values[randomNumber];
  }
}

enum TypeCard {
  credit(id: 1),
  debit(id: 2);

  final int id;
  const TypeCard({required this.id});
}
