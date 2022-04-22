import 'package:flutter/material.dart';

import 'const.dart';

abstract class TextStyleDefault {
  static const buttonMainColorTextStyle = TextStyle(
      color: Const.bgColor, fontWeight: FontWeight.bold, fontSize: 16);
  static const buttonWhiteTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  static const mainTextStyle = TextStyle(
      color: Const.mainColor, fontWeight: FontWeight.bold, fontSize: 16);
  static const blackTextStyle = TextStyle(
      color: Const.textColor, fontWeight: FontWeight.bold, fontSize: 16);
  static const whiteTextStyle = TextStyle(color: Colors.white, fontSize: 16);
  static const whiteBoldTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  static const hintTextStyle = TextStyle(color: Const.hintColor, fontSize: 14);
  static const hintTextStyleBold = TextStyle(
      color: Const.hintColor, fontSize: 14, fontWeight: FontWeight.bold);
  static final hintText50Style =
      TextStyle(color: Const.hintColor.withOpacity(0.5), fontSize: 14);
  static const smallHintTextStyle =
      TextStyle(color: Const.hintColor, fontSize: 12);
  static const smallRequiredTextStyle =
      TextStyle(color: Const.errorColor, fontSize: 12);
  static const smallBlackTextStyle =
      TextStyle(color: Const.textColor, fontSize: 12);
  static const smallBlackBoldTextStyle = TextStyle(
      color: Const.textColor, fontSize: 12, fontWeight: FontWeight.bold);
  static const smallWhiteTextStyle =
      TextStyle(color: Colors.white, fontSize: 12);
  static const smallMainTextStyle =
      TextStyle(color: Const.mainColor, fontSize: 12);

  static const mediumBlackTextStyle =
      TextStyle(color: Const.textColor, fontSize: 16);
  static const mediumBlackTextStyleBold = TextStyle(
      color: Const.textColor, fontSize: 16, fontWeight: FontWeight.bold);
  static const profileBlackTextStyleBold = TextStyle(
      color: Const.textColor, fontSize: 18, fontWeight: FontWeight.bold);
  static const mediumSubTextStyleBold = TextStyle(
      color: Const.subColor, fontSize: 16, fontWeight: FontWeight.bold);
  static const mediumRedTextStyleBold = TextStyle(
      color: Const.redColor, fontSize: 16, fontWeight: FontWeight.bold);
  static const normalBlackTextStyle =
      TextStyle(color: Const.textColor, fontSize: 14);
  static const normalWhiteTextStyle =
      TextStyle(color: Colors.white, fontSize: 14);
  static TextStyle normalWhiteTextStyleOpacity =
      TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14);
  static const normalWhiteTextStyleBold =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
  static const normalBlackTextStyleBold = TextStyle(
      color: Const.textColor, fontSize: 14, fontWeight: FontWeight.bold);
  static const normalErrorTextStyleBold = TextStyle(
      color: Const.errorColor, fontSize: 14, fontWeight: FontWeight.bold);
  static const normalErrorTextStyle =
      TextStyle(color: Const.errorColor, fontSize: 14);
  static const normalMainTextStyle =
      TextStyle(color: Const.mainColor, fontSize: 14);
  static const normalMainTextStyleBold = TextStyle(
      color: Const.mainColor, fontSize: 14, fontWeight: FontWeight.bold);
  static const normalSubTextStyleBold = TextStyle(
      color: Const.subColor, fontSize: 14, fontWeight: FontWeight.bold);
  static const normalSubTextStyle =
      TextStyle(color: Const.subColor, fontSize: 14);

  static const loginTextStyle = TextStyle(color: Const.textColor, fontSize: 20);
  static const loginWhiteTextStyle =
      TextStyle(color: Colors.white, fontSize: 20);
  static const unselectedTextStyle =
      TextStyle(color: Const.unselectedColor, fontSize: 10);
  static const selectedTextStyle =
      TextStyle(color: Const.subColor, fontSize: 10);
  static const deleteGreyTextStyle =
      TextStyle(color: Const.deleteGreyColor, fontSize: 14);

  static const underlineTextStyle = TextStyle(
      decoration: TextDecoration.underline,
      color: Const.mainColor,
      fontSize: 12);
}
