import 'dart:math';

class Helpers {
  static String generateID() {
    return Random().nextInt(99999999).toString();
  }
}
