import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  final String title;
  final String message;
  final String? type;
  final Color? colorText;

  AppSnackbar({
    required this.title,
    required this.message,
    required this.type,
    this.colorText,
  }) {
    Color? backgroundColor;

    switch (type) {
      case 'success':
        backgroundColor = Colors.green;
        break;
      case 'error':
        backgroundColor = Colors.red;
        break;
      case 'warning':
        backgroundColor = Colors.orange;
        break;
      default:
        backgroundColor = Colors.red;
    }

    Get.snackbar(
      title,
      message,
      // messageText: Text(data),
      backgroundColor: backgroundColor,
      colorText: colorText,
      // snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10.0),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: const Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
