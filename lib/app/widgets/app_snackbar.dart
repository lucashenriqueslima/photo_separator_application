import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType {
  error,
  success,
  info,
}

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

    Get.closeCurrentSnackbar();

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[900],
      borderRadius: 10.0,
      margin: const EdgeInsets.all(20.0),
      maxWidth: 500.0,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
      titleText: const Text(
        'Snackbar Moderno',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: const Text(
        'Este é um exemplo de um Snackbar moderno.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      icon: const Icon(
        Icons.info_outline,
        color: Colors.white,
      ),
    );
  }
}
