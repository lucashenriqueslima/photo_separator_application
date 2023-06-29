import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/env.dart';

abstract class HttpMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpClient {
    Future httpRequest({
    required String url,
    required String method,
    Map? headers,
    dynamic body,
    bool useDefaultUrl = true,
  }) async {
    final Dio dio = Dio();

    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;

    final deafaultHeaders =
        headers?.cast<String, String>() ?? <String, String>{}
          ..addAll({
            'Content-Type': Headers.formUrlEncodedContentType,
            'Accept': 'application/json',
            'Authorization': 'Bearer ${AuthService.to.user.value.token}'
          });

    try {
      Response response = await dio.request(
        useDefaultUrl ? '${Env.API_URL}$url' : url,
        options: Options(
          method: method,
          headers: deafaultHeaders,
        ),
        data: body,
      );

      print(json.decode(response.toString()));
      return json.decode(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        print('error in http request');
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        return json.decode(e.response.toString());
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
