import 'dart:io';

class Console {
  static void write(String message) {
    stdout.writeln(message);
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
}
