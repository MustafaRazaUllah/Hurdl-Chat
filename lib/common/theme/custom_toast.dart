import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomtToast {
  static void success(String message) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  static void error(
    String message, {
    int? seconds,
  }) {
    Get.snackbar(
      "Error",
      message,
      duration: Duration(seconds: seconds ?? 3),
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}
