import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor deepPurple = MaterialColor(
    0xff7c4dff, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff895fff ),//10%
      100: Color(0xff9671ff),//20%
      200: Color(0xffa382ff),//30%
      300: Color(0xffb094ff),//40%
      400: Color(0xffbea6ff),//50%
      500: Color(0xffcbb8ff),//60%
      600: Color(0xffd8caff),//70%
      700: Color(0xffe5dbff),//80%
      800: Color(0xfff2edff),//90%
      900: Color(0xffffffff),//100%
    },
  );
} // yo