import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

class AuthenticationMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.to.isAuthenticated.value
        ? null
        : const RouteSettings(name: Routes.LOGIN);
  }
}
