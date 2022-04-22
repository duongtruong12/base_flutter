import 'dart:convert';

import 'package:flutter/services.dart';

import '../utils/global/globals_variable.dart';

class Parameter {
  static Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/criteria.json');
    data = await json.decode(response);
  }

  Future<void> checkJson() async {
    if (data == null) {
      await readJson();
    }
  }
}
