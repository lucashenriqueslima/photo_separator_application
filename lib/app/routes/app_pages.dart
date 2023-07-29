import 'package:get/get.dart';
import 'package:photo_separator/app/modules/event/event_create/event_create_view.dart';
import 'package:photo_separator/app/modules/home/home_binding.dart';
import 'package:photo_separator/app/modules/home/home_view.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/event/event_binding.dart';
import '../modules/event/event_detail/event_detail_binding.dart';
import '../modules/event/event_detail/event_detail_view.dart';
import '../modules/event/event_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
      transition: Transition.noTransition,
      children: [
        GetPage(
          name: _Paths.CREATE_EVENT,
          page: () => const EventCreateView(),
          binding: EventBinding(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: _Paths.EVENT_DETAIL,
          page: () => const EventDetailView(),
          binding: EventDetailBinding(),
          transition: Transition.noTransition,
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
