import '../utils/messages.dart';

String? validateAccount(String value) {
  RegExp regExp = RegExp(r'^\d{4}-\d$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidAccount;
  }

  return null;
}

String? validateAddress(String value) {
  if (!value.contains(' ')) {
    return Messages.invalidAddress;
  }

  return null;
}

String? validateAgency(String value) {
  RegExp regExp = RegExp(r'^\d{4}$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidAgency;
  }

  return null;
}

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

String? validateBirthAt(String value) {
  RegExp regExp = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidFormatBirthAt;
  }

  final match = regExp.firstMatch(value)!;
  final day = int.parse(match.group(1)!);
  final month = int.parse(match.group(2)!);
  final year = int.parse(match.group(3)!);

  if (day < 1 || day > 31) {
    return Messages.invalidDayBirthAt;
  }

  if (month < 1 || month > 12) {
    return Messages.invalidMonthBirthAt;
  }

  final currentYear = DateTime.now().year;

  if (year < currentYear - 130 || year > currentYear) {
    return 'Ano inválido, deve ser entre ${currentYear - 130} e $currentYear.';
  }

  return null;
}

String? validateCNPJ(String value) {
  RegExp regExp = RegExp(r'^\d+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidNumbers;
  }

  if (value.length != 14) {
    return Messages.invalidCpnj;
  }

  return null;
}

String? validateCPF(String value) {
  RegExp regExp = RegExp(r'^\d+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidNumbers;
  }

  if (value.length != 11) {
    return Messages.invalidCpf;
  }

  return null;
}

String? validateEmail(String value) {
  RegExp regExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidEmail;
  }

  return null;
}

String? validateName(String value) {
  if (!value.contains(' ')) {
    return Messages.invalidName;
  }

  return null;
}

String? validatePassword(String value) {
  RegExp regExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidPassword;
  }

  return null;
}

String? validateTelephone(String value) {
  RegExp regExp = RegExp(r'^\d+$');

  if (!regExp.hasMatch(value)) {
    return Messages.invalidNumbers;
  }

  if (value.length != 11) {
    return Messages.invalidTelephone;
  }

  return null;
}
