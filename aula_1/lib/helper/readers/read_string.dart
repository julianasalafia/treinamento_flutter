import 'dart:io';

import 'package:aula_1/helper/constants/constants.dart';

String readString(String prompt) {
  String? value;

  do {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    value = input!;

    if (!value.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      print(errorMessageString);
    }
  } while (!value.contains(RegExp(r'^[a-zA-Z\s]+$')));

  return value;
}

String readNumberAsString(String prompt) {
  String? value;

  do {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    value = input!;

    if (!value.contains(RegExp(r'^\d+$'))) {
      print(errorMessageIntAsString);
    }
  } while (!value.contains(RegExp(r'^\d+$')));

  return value;
}
