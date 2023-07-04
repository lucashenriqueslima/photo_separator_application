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
  final SnackbarType type;
  final Color? colorText;

  AppSnackbar({
    required this.title,
    required this.message,
    required this.type,
    this.colorText,
  }) {
    Color? backgroundColor;
    IconData icon;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = Colors.green[900];
        icon = Icons.check_circle_outline;
        break;
      case SnackbarType.error:
        backgroundColor = const Color.fromARGB(255, 205, 0, 0);
        icon = Icons.error_outline;
        break;
      case SnackbarType.info:
        backgroundColor = Colors.grey[900];
        icon = Icons.info_outline;
        break;
      default:
        backgroundColor = Colors.grey[900];
        icon = Icons.info_outline;
    }

    Get.closeCurrentSnackbar();

    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(20.0),
      maxWidth: 500.0,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
        size: 32.0,
      ),
    );
  }
}
