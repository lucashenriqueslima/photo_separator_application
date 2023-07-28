import 'package:get/get.dart';
import 'package:photo_separator/app/core/keys/http_exceptions_consts.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';
import 'package:photo_separator/app/widgets/app_snackbar.dart';

class HttpException implements Exception {
  final statusCode;
  final title;
  final message;
  late int delay;

  HttpException(this.statusCode, this.title, this.message) {
    AppSnackbar(
      title: title,
      message: message,
      type: SnackbarType.error,
    );
  }

  HttpException.withDelay(this.statusCode, this.title, this.message,
      [this.delay = 1]) {
    Future.delayed(Duration(seconds: delay), () {});
  }

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends HttpException {
  BadRequestException(String? message)
      : super(400, badRequestExceptionTitle,
            message ?? badRequestExceptionMessage);
}

class UnauthorisedException extends HttpException {
  UnauthorisedException(String? message)
      : super(401, unauthorisedExceptionTitle,
            message ?? unauthorisedExceptionMessage) {
    if (Get.currentRoute != Routes.LOGIN) {
      Get.offAllNamed(Routes.LOGIN);
      AuthService.to.logout();
    }
  }
}

class ForbiddenException extends HttpException {
  ForbiddenException(String? message)
      : super.withDelay(403, forbiddenExceptionTitle,
            message ?? forbiddenExceptionMessage) {
    if (!AuthService.to.isAuthenticated.value) {
      AuthService.to.logout();
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    Get.offAllNamed(Routes.DASHBOARD);
  }
}

class NotFoundException extends HttpException {
  NotFoundException(String? message)
      : super(404, notFoundExceptionTitle, message ?? notFoundExceptionMessage);
}

class UnprocesableEntityException extends HttpException {
  UnprocesableEntityException(String? message)
      : super(422, unprocesableEntityExceptionTitle,
            message ?? unprocesableEntityExceptionMessage);
}

class InternalServerErrorException extends HttpException {
  InternalServerErrorException(String? message)
      : super(500, internalServerErrorExceptionTitle,
            message ?? internalServerErrorExceptionMessage);
}

class UndefinedException extends HttpException {
  UndefinedException(String? message)
      : super(0, 'Erro', message ?? 'Erro desconhecido.');
}
