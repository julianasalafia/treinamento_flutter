import 'dart:math';

import '../persons/person_model.dart';

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
    final random = Random();

    final cardNumber = List.generate(4, (index) {
      final generatedNumber = random.nextInt(9999) + 1;
      String paddedNumber = generatedNumber.toString().padLeft(16, '0');
      return paddedNumber;
    });

    return cardNumber.join(' ');
  }

  static String generateCVV() {
    final random = Random();

    int randomNumber = random.nextInt(999);
    return randomNumber.toString();
  }
}

enum CardFlag {
  masterCard(label: 'Mastercard'),
  visa(label: 'Visa');

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
