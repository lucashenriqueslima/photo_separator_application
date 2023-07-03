import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/user_model.dart';
import 'package:photo_separator/app/data/repositories/auth_repositoy.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final AuthRepository _repository = AuthRepository();

  final Rx<User> user = User().obs;
  final RxBool isLogged = false.obs;

  Future<AuthService> init() async {
    initUser();
    return this;
  }

  void initUser() {
    final initialUser = _repository.readUser();
    if (initialUser.token != null) {
      user.value = initialUser;
      isLogged.value = true;
    }

    ever(user, (_) {
      _repository.writeUser(user.value);
    });
  }

  Future<bool> login(String email, String password) async {
    final response = await _repository.login(email, password);

    if (!response.success) {
      return false;
    }

    user.value = User.fromJson(response);
    isLogged.value = true;

    return true;
  }

  void logout() {
    user.value = User();
    isLogged.value = false;
  }
}
