import 'package:get/get.dart';
import 'package:photo_separator/app/routes/midllewares/authentication_midlleware.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/event/event_binding.dart';
import '../modules/event/event_detail/event_detail_binding.dart';
import '../modules/event/event_detail/event_detail_view.dart';
import '../modules/event/event_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [AuthenticationMiddleware()],
      children: [
        GetPage(
          name: _Paths.EVENT,
          page: () => const EventView(),
          binding: EventBinding(),
          children: [
            GetPage(
              name: '/:eventId',
              page: () => const EventDetailView(),
              binding: EventDetailBinding(),
              transition: Transition.noTransition,
            ),
          ],
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
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
