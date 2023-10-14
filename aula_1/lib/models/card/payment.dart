enum Payment {
  credit,
  debit;

  factory Payment.fromInt(int value) {
    switch (value) {
      case 1:
        return Payment.credit;
      default:
        return Payment.debit;
    }
  }
}
