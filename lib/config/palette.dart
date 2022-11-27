import 'package:flutter/material.dart';

class Palette {
  static MaterialColor red = const MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color.fromRGBO(153, 27, 27, 1), //10%
      100: Color.fromRGBO(153, 27, 27, 1), //20%
      200: Color.fromRGBO(153, 27, 27, 1), //30%
      300: Color.fromRGBO(153, 27, 27, 1), //40%
      400: Color.fromRGBO(153, 27, 27, 1), //50%
      500: Color.fromRGBO(153, 27, 27, 1), //60%
      600: Color.fromRGBO(153, 27, 27, 1), //70%
      700: Color.fromRGBO(153, 27, 27, 1), //80%
      800: Color.fromRGBO(153, 27, 27, 1), //90%
      900: Color.fromRGBO(153, 27, 27, 1), //100%
    },
  );
}
