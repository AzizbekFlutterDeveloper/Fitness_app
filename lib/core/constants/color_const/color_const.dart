import 'package:flutter/material.dart';

class ColorConst {
  static final ColorConst _instance = ColorConst._init();
  static ColorConst get instance => _instance;

  Color kPrimaryColor = const Color(0xffD0FD3E);
  Color white = const Color(0xffFFFFFF);
  Color red = const Color(0xffFF2424);
  Color scaffoldBackgroundColor = const Color(0xff1C1C1E);
  Color grey = const Color(0xff2C2C2E);

  ColorConst._init();
}