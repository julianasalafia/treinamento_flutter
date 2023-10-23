import 'dart:io';

import 'messages.dart';
import 'typedefs.dart';

class Console {
  static void write(String message) {
    stdout.write(message);
  }

  static String writeAndReadWithValidator(
    String message,
    Validator validator,
  ) {
    String? errorMessage;
    String value;

    do {
      value = writeAndRead(message);

      errorMessage = validator(value);
      if (errorMessage != null) {
        write(errorMessage);
        writeEmpty();
      }
    } while (errorMessage != null);

    return value;
  }

  static void writeEmpty() {
    stdout.writeln();
  }

  static String writeAndRead(String message) {
    stdout.write(message);
    return read();
  }

  static String read() {
    return stdin.readLineSync()!;
  }

  static int readInt() {
    final value = stdin.readLineSync()!;

    return int.parse(value);
  }

  static void clearTerminal() {
    if (Platform.isWindows) {
      print(Process.runSync("cls", [], runInShell: true).stdout);
    } else {
      print(Process.runSync("clear", [], runInShell: true).stdout);
    }
  }

  static String writeAndReadWithValidatorGenerics<T>(
    String message, {
    required ValidatorGenerics<T> validator,
    required T? Function(String) parser,
  }) {
    write(message);

    String? errorMessage;
    String value;

    do {
      value = read();

      final parsedValue = parser(value);
      if (parsedValue == null) {
        write(Messages.invalidValue);
      }

      errorMessage = validator(parsedValue as T);
      if (errorMessage != null) {
        write(errorMessage);
        write(Messages.tryAgain);
      }
    } while (errorMessage != null);

    return value;
  }
}
