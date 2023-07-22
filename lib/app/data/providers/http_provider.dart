import 'package:dio/dio.dart';
import 'package:photo_separator/app/core/client/http_client.dart';
import 'package:path/path.dart' as path;
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

  getEventById(String id) async {
    final response = await _httpClient.request(
      url: '/events/$id',
      method: HttpMethods.get,
    );

    return response;
  }

  addEventImage(EventTemporaryImage eventTemporaryImage, int? eventId) async {
    final formData = FormData();

    final imagePath = path.basename(
        '${eventTemporaryImage.image!.path}${eventTemporaryImage.image!.name}');

    final imageName = path.basename(imagePath);

    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(
        imagePath,
        filename: imageName,
      ),
    ));

    final response = await _httpClient.request(
      url: '/events/$eventId/images',
      method: HttpMethods.post,
      body: formData,
      bodyHasFile: true,
    );

    return response;
  }
}
