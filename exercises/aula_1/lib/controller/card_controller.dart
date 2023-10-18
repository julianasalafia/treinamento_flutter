import 'package:aula_1/helper/readers/read_int.dart';
import 'package:aula_1/models/card/card_flag.dart';
import 'package:aula_1/models/card/card_model.dart';
import 'package:aula_1/models/card/credit_card_model.dart';
import 'package:aula_1/models/card/debit_card_model.dart';
import 'package:aula_1/models/card/payment.dart';
import 'package:aula_1/models/invoice/invoice_model.dart';
import 'package:aula_1/models/person/person_model.dart';

import '../helper/constants/constants.dart';

class CardController {
  CardModel getCard(PersonModel personModel) {
    final creditOrDebit = readInt(creditOrDebitMessage, 2);
    final payment = Payment.fromInt(creditOrDebit);
    late final card;

    if (payment == Payment.credit) {
      final invoice = InvoiceModel.empty();
      final limit = 1000.0;
      final spentValue = 250.0;
      final expiringDay = 15;
      final turnDay = 10;
      final person = personModel;
      final cardNumber = '123456789';
      final cvv = '123';
      final flag = CardFlag.masterCard;
      final expirationDate = DateTime.now().add(Duration(days: 2000));

      card = CreditCardModel(
        invoice: invoice,
        limit: limit,
        spentValue: spentValue,
        expiringDay: expiringDay,
        turnDay: turnDay,
        person: person,
        cardNumber: cardNumber,
        cvv: cvv,
        flag: flag,
        expirationDate: expirationDate,
      );
    } else if (payment == Payment.debit) {
      final person = personModel;
      final cardNumber = '123456789';
      final cvv = '123';
      final flag = CardFlag.masterCard;
      final expirationDate = DateTime.now().add(Duration(days: 2000));

      card = DebitCardModel(
        person: person,
        cardNumber: cardNumber,
        cvv: cvv,
        flag: flag,
        expirationDate: expirationDate,
      );
    }
    return card;
  }
}
