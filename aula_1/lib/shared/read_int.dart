import 'dart:io';

int readInt(String prompt, int maxValue) {
  int? value;

  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    value = int.tryParse(input!);

    if (value != null && value <= maxValue) {
      return value;
    } else {
      print('Erro: Por favor, escolha um número válido.');
    }
  }
}
