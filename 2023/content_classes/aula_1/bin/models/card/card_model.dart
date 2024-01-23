abstract class CardModel {
  final PersonModel person;
  final String cardNumber;
  final String cvv;
  final CardFlag flag;
  final DateTime expirationDate;

  CardModel({
    required this.person,
  });
}

enum CardFlag { masterCard, visa }
