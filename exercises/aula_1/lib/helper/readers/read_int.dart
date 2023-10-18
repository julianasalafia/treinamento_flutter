import 'dart:io';

import '../constants/constants.dart';

int readInt(String prompt, int maxValue) {
  int? value;

  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    value = int.tryParse(input!);

    if (value != null && value <= maxValue) {
      return value;
    } else {
      print(errorMessageInt);
    }
  }
}
