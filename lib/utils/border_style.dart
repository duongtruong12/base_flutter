import 'package:flutter/material.dart';

import 'const.dart';

final defaultBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Const.borderDefaultColor));
final focusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Const.mainColor));

final errorBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(color: Const.errorColor));
