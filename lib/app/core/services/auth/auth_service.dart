import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/user_model.dart';
import 'package:photo_separator/app/data/repositories/auth_repositoy.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final AuthRepository _repository = AuthRepository();

  final Rx<User> user = User().obs;
  final RxBool isAuthenticated = false.obs;

  Future<AuthService> init() async {
    initUser();
    return this;
  }

  void initUser() {
    final initialUser = _repository.readUser();
    if (initialUser.token != null) {
      user.value = initialUser;
      isAuthenticated.value = true;
    }

    ever(user, (_) {
      _repository.writeUser(user.value);
    });
  }

  login(String email, String password) async {
    final response = await _repository.login(email, password);

    if (!response.success) {
      return response;
    }

    final rawUser = response.data['data']['user'];
    final rawToken = response.data['data']['token'];

    Map<String, dynamic> newUser = {
      'name': rawUser['name'],
      'email': rawUser['email'],
      'token': rawToken,
    };

    user.value = User.fromJson(newUser);
    isAuthenticated.value = true;

    return response;
  }

  void logout() {
    user.value = User();
    isAuthenticated.value = false;
  }
}
