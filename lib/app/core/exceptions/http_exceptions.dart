import 'package:get/get.dart';
import 'package:photo_separator/app/core/keys/http_exceptions_consts.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

class HttpException implements Exception {
  final statusCode;
  final title;
  final message;
  int? delay = 1;

  HttpException(this.statusCode, this.title, this.message) {
    //
  }

  HttpException.withDelay(this.statusCode, this.title, this.message,
      [this.delay]) {
    Future.delayed(const Duration(seconds: 1), () {});
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
      : super.withDelay(401, unauthorisedExceptionTitle,
            message ?? unauthorisedExceptionMessage) {
    if (Get.currentRoute != Routes.LOGIN) {
      Get.offAllNamed(Routes.LOGIN);
      AuthService.to.logout();
    }
  }
}

class ForbiddenException extends HttpException {
  ForbiddenException(String? message)
      : super.withDelay(
            403, forbiddenExceptionTitle, message ?? forbiddenExceptionMessage);
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

class undefinedException extends HttpException {
  undefinedException(String? message)
      : super(0, 'Erro', message ?? 'Erro desconhecido.');
}
