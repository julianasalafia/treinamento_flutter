import 'dart:io';

String readString(String prompt) {
  String? value;

  do {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    value = input!;

    if (!value.contains(RegExp(r'^[a-zA-Z\s]+$'))) {
      print("Erro: Por favor, digite uma string válida.");
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
      print("Erro: Por favor, digite um número válido.");
    }
  } while (!value.contains(RegExp(r'^\d+$')));

  return value;
}
