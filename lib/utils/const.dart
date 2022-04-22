import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Const {
  static final Map<int, Color> colorMap = {
    50: mainColor.withOpacity(0.1),
    100: mainColor.withOpacity(0.2),
    200: mainColor.withOpacity(0.3),
    300: mainColor.withOpacity(0.4),
    400: mainColor.withOpacity(0.5),
    500: mainColor.withOpacity(0.6),
    600: mainColor.withOpacity(0.7),
    700: mainColor.withOpacity(0.8),
    800: mainColor.withOpacity(0.9),
    900: mainColor.withOpacity(1),
  };

  static final materialColor = MaterialColor(0xFF00479A, colorMap);

  static const double appBarHeight = 84.0;

  // design device sizes
  static const double designWidth = 375;
  static const double designHeight = 746;

  // common radius
  static const double radius12 = 12;
  static const double radius32 = 32;

  // convert hex string to Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static const borderColorDialog = Color(0xffe9e9ec);

  // resizable
  static double resizeVer(double size) {
    return Get.height / designHeight * size;
  }

  static double resizeHoz(double size) {
    return Get.width / designWidth * size;
  }

  // app's background color
  static const bgColor = Color(0xFFF7F7F7);
  static const bgColorApp = Color(0xFFFAFAFA);
  static const bgColorMain = Color(0xFFD9E3E9);

  // active menu color
  // background menu color
  static const mainColor = Color(0xFF00456E);
  static const hintColor = Color(0xFF818181);
  static const textColor = Color(0xFF343539);
  static const borderDefaultColor = Color(0xFFE5E5E5);
  static const errorColor = Color(0xFFEB1111);
  static const redColor = Color(0xFFE22940);
  static const disableColor = Color(0xFFDCDCDC);
  static const greyColor = Color(0xFFEDEDED);
  static const deleteGreyColor = Color(0xFF777777);
  static const lineColor = Color(0xFFE7E7E7);
  static const subColor = Color(0xFFF58220);
  static const unselectedColor = Color(0xFF72767E);
  static const linearGradient1 = Color(0xFF056BA8);
  static const linearGradient2 = Color(0xFF01507E);
  static const cutBg = Color(0xFFDDD270);
  static const cutItem = Color(0xFF70C3DD);
  static const listGradient = [
    Const.linearGradient1,
    Const.linearGradient2,
  ];
}
