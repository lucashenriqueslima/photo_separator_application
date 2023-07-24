import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:photo_separator/app/core/exceptions/http_exceptions.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';

//TODO - Implementar tratamento de erros
//TODO - Substituir defaultUrl por env

const String _defaultUrl = 'http://127.0.0.1:80/api';

abstract class HttpMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class ApiResponse<T> {
  final int? statusCode;
  final T data;
  late bool success;

  ApiResponse(this.statusCode, this.data) {
    if (![200, 201, 202, 204].contains(statusCode)) {
      success = false;
      return;
    }
    success = true;
  }
}

class GetHttpException {
  GetHttpException(statusCode, data) {
    final message = data['message'] ?? data['error'] ?? data['errors'];

    switch (statusCode) {
      case 400:
        BadRequestException(message);
      case 401:
        UnauthorisedException(message);
      case 403:
        ForbiddenException(message);
      case 404:
        NotFoundException(message);
      case 422:
        UnprocesableEntityException(message);
      case 500:
        InternalServerErrorException(message);
      default:
        UndefinedException(message);
    }
  }
}

class HttpClient {
  final Dio _dio = Dio();

  Future<ApiResponse<dynamic>> request({
    required String url,
    required String method,
    Map? headers,
    dynamic body,
    bool useDefaultUrl = true,
    bool bodyHasFile = false,
  }) async {
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;

    final deafaultHeaders =
        headers?.cast<String, String>() ?? <String, String>{}
          ..addAll({
            'Content-Type': bodyHasFile
                ? 'multipart/form-data'
                : Headers.formUrlEncodedContentType,
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthService.to.user.value.token}'
          });

    try {
      Response response = await _dio.request(
        useDefaultUrl ? '$_defaultUrl$url' : url,
        options: Options(
          method: method,
          headers: deafaultHeaders,
        ),
        data: body,
      );

      final decodedData = json.decode(response.toString());

      print(decodedData);

      return ApiResponse(response.statusCode, decodedData);
    } on DioError catch (e) {
      if (e.response != null) {
        print('error in http request');
        print(e.response);

        final decodedData = json.decode(e.response.toString());

        GetHttpException(e.response?.statusCode, decodedData);

        return ApiResponse(e.response?.statusCode, decodedData);
      } else {
        Get.snackbar('Error', e.message);
        print('else');
        print(e.requestOptions);
        print(e.message);
      }
    }
    throw Exception('Error in http request');
  }
}
