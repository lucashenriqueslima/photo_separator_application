import 'package:dio/dio.dart';
import 'package:photo_separator/app/core/client/http_client.dart';
import 'package:photo_separator/app/data/models/event_temporary_image.dart';

class HttpProvider {
  static HttpProvider get to => HttpProvider();

  final HttpClient _httpClient = HttpClient();

  login(String email, String password) async {
    final response = await _httpClient.request(
      url: '/auth/login',
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return response;
  }

  getAllEvents() async {
    final response = await _httpClient.request(
      url: '/events',
      method: HttpMethods.get,
    );

    return response;
  }

  getEventById(id) async {
    final response = await _httpClient.request(
      url: '/events/$id',
      method: HttpMethods.get,
    );

    return response;
  }

  addEventImage(EventTemporaryImage eventTemporaryImage, String eventId) async {
    FormData formData = FormData.fromMap({
      'image': eventTemporaryImage.bytes,
      'name': eventTemporaryImage.image!.name,
      'size': eventTemporaryImage.size,
    });

    final response = await _httpClient.request(
      url: '/events/$eventId/images',
      method: HttpMethods.post,
      body: formData,
      bodyHasFile: true,
    );

    return response;
  }

  addEventIdentification(String bytes, String name, String eventId) async {
    FormData formData = FormData.fromMap({
      'image': bytes,
      'name': name,
    });

    final response = await _httpClient.request(
      url: '/events/$eventId/identifications',
      method: HttpMethods.post,
      body: formData,
    );

    return response;
  }
}
