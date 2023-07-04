import 'package:get/get.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    print(AuthService.to.isLogged.value);

    if (AuthService.to.isLogged.value) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    super.onReady();
  }
}
