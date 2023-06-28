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
    if (initialUser != null) {
      user.value = initialUser;
      isLogged.value = true;
    }

    ever(user, (_) {
      _repository.writeUser(user.value);
    });
  }

}