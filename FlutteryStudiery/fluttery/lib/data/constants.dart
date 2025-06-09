import 'package:flutter/widgets.dart';

class KConstants {
  static const String themeModeKey = "themeModeKey";
}

class HTextStyle {
  static const TextStyle titleText = TextStyle(
    fontSize: 23,
    color: Color.fromARGB(176, 255, 153, 0),
    fontWeight: FontWeight.bold,
  );
  static const TextStyle basicDescriptionText = TextStyle(
    fontSize: 18,
  );
  static const TextStyle lobotomiteText = TextStyle(
    letterSpacing: 10,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle mainHeaderText = TextStyle(
    fontSize: 27,
    color: Color.fromARGB(255, 255, 255, 255),
  );
}
