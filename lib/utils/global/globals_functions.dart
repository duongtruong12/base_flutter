import 'package:flutter/material.dart';
import 'package:get/get.dart';

showInfo(message) {
  if (Get.context != null) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

showError(message) {
  if (Get.context != null) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

dismissKeyboard() {
  if (Get.context != null) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }
}
