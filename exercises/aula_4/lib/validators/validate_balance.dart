import 'package:dart_project/utils/messages.dart';

String? validateBalance(String value) {
  try {
    double.parse(value);
    return null;
  } catch (e) {
    return Messages.invalidBalance;
  }
}

String? validateBalanceGenerics(double value) {
  return null;
}
