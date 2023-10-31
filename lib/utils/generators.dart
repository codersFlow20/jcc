import 'dart:math';

class GeneratorUtils {
  static String generateSixDigitRandomPin() {
    final random = Random();

    int min = 100000;
    int max = 999999;
    int pin = min + random.nextInt(max - min);

    return pin.toString();
  }
}