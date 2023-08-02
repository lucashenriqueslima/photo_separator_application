import 'package:photo_separator/app/core/client/http_client.dart';
import 'package:photo_separator/app/data/models/event_identification_model.dart';
import 'package:photo_separator/app/data/models/event_image_model.dart';

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

  getAllEventIdentifications(eventId) async {
    final response = await _httpClient.request(
      url: '/events/$eventId/identifications',
      method: HttpMethods.get,
    );

    return response;
  }

  getAllEventImages(eventId) async {
    final response = await _httpClient.request(
      url: '/events/$eventId/images',
      method: HttpMethods.get,
    );

    return response;
  }

  addEventImage(EventImage tmpEventRepository, String eventId) async {
    tmpEventRepository.name = tmpEventRepository.image!.name;

    final response = await _httpClient.request(
        url: '/events/$eventId/images',
        method: HttpMethods.post,
        body: tmpEventRepository.toJson(),
        useHttpExceptions: false);

    return response;
  }

  addEventIdentification(
      EventIdentification tmpEventIdentfications, String eventId) async {
    final response = await _httpClient.request(
      url: '/events/$eventId/identifications',
      method: HttpMethods.post,
      body: tmpEventIdentfications.toJson(),
    );

    return response;
  }

  compareFaces(eventId) async {
    final response = await _httpClient.request(
      url: '/events/$eventId/compare-faces',
      method: HttpMethods.post,
    );

    print(response);

    return response;
  }
}
