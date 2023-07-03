import 'package:photo_separator/app/core/client/http_client.dart';

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
}
