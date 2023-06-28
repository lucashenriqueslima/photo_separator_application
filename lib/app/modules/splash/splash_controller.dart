import 'package:get/get.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    if(AuthService.to.isLogged.value) {
      Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
    super.onReady();
  }
}