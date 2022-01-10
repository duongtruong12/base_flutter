import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Const {
  static final Map<int, Color> colorMap = {
    50: bgMenu.withOpacity(0.1),
    100: bgMenu.withOpacity(0.2),
    200: bgMenu.withOpacity(0.3),
    300: bgMenu.withOpacity(0.4),
    400: bgMenu.withOpacity(0.5),
    500: bgMenu.withOpacity(0.6),
    600: bgMenu.withOpacity(0.7),
    700: bgMenu.withOpacity(0.8),
    800: bgMenu.withOpacity(0.9),
    900: bgMenu.withOpacity(1),
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

  static Color iconDefaultColor = hexToColor('#1E1F20');

  // resizable
  static double resizeVer(double size) {
    return Get.height / designHeight * size;
  }

  static double resizeHoz(double size) {
    return Get.width / designWidth * size;
  }

  static List<String> listGenderSelect = ["選択無し", "女", "男"];

  // appbar icon size
  static double appBarIconSize = 38.0;

  // app's background color
  static const bgColor = Color(0xFFF7F7F7);
  static const danger = Color(0xFFFF4D4F);

  //rgba(30, 31, 32, 0.2)
  static const grey02 = Color.fromRGBO(30, 31, 32, 0.2);

  //rgba(30, 31, 32, 0.15)
  static const grey015 = Color.fromRGBO(30, 31, 32, 0.15);

  static const grey06 = Color.fromRGBO(30, 31, 32, 0.6);
  static const grey158 = Color.fromRGBO(158, 158, 158, 1);
  static const grey213 = Color.fromRGBO(213, 213, 213, 1);

  // rgba(143, 146, 161, 0.2)
  static const borderColor = Color.fromRGBO(143, 146, 161, 0.2);

  // search background
  static const bgSearch = Color(0xFFF9B801);

  //background ticket
  static const bgTicket = Color(0xFFF2AB2B);

  //background notification
  static const bgNotification = Color(0xFFFF7875);

  // faq question
  static final blueText = hexToColor("#00479A");

  // camera icon background color
  static const cameraBgColor = Color(0xFF52CFC5);

  // camera icon certificate background color
  static const certificateBgColor = Color(0xFFF9B801);

  // camera icon disability background color
  static const disabilityBgColor = Color(0xFFFFA5B5);

  // active menu color
  // background menu color
  static const bgMenu = Color(0xFF00479A);

  // background sub menu color
  static const bgSubMenu = Color(0xFFF7F7F7);

  // background menu car
  static const bgCar = Color.fromRGBO(82, 207, 197, 0.2);
  static const bgHome = Color.fromRGBO(0, 159, 232, 1);
  static final activeMenuColor = hexToColor("#00479A");
  static final ticketType1 = hexToColor("#00479A");
  static final ticketType2 = hexToColor("#08979C");
  static final ticketType3 = hexToColor("#C41D7F");

  // text bold color
  static final textBold = hexToColor('#1E1F20');

  // text normal color
  static final typeTicketBackground = hexToColor('#52CFC5');

  static final textNormal = hexToColor('#8F92A1');

  // body background color
  static final bgBody = hexToColor('#F7F7F7');

  // ticket appbar height
  static double ticketBarHeight = 70;
  static const displayBtnColor = Color(0xFF00479A);
  static const configurationBtnColor = Color(0xFFF9B801);

  static const white = Color(0xFFFFFFFF);

  //yellow background in menu
  static final yellow = hexToColor('#F9B801');
  static const black = Color.fromRGBO(30, 31, 32, 1);
}
