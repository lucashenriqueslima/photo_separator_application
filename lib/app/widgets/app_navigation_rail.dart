import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/modules/dashboard/dashboard_controller.dart';
import 'package:photo_separator/app/routes/app_pages.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/themes/styles/app_text_styles.dart';

class AppNavigationRail extends StatelessWidget {
  AppNavigationRail({super.key});

  final controller = Get.put(AppNavigationRailController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationRail(
        extended: controller.isExtetend.value,
        selectedIconTheme: IconThemeData(color: AppColors.i.primary),
        selectedLabelTextStyle:
            context.appTextStyles.textBold.copyWith(fontSize: 14),
        unselectedIconTheme: IconThemeData(color: AppColors.i.disabled),
        backgroundColor: context.secondary,
        unselectedLabelTextStyle: context.appTextStyles.textBold
            .copyWith(fontSize: 14, color: AppColors.i.disabled),
        labelType: NavigationRailLabelType.selected,
        destinations: _getDestinations(),
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: (int index) =>
            controller.changeDestionation(index),
        elevation: 2,
      ),
    );
  }
}

class AppNavigationRailController extends GetxController {
  final dashboardController = Get.find<DashboardController>();

  final RxInt currentIndex = 0.obs;
  final RxBool isExtetend = false.obs;

  void changeDestionation(int index) {
    if (Get.currentRoute != Routes.DASHBOARD) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      dashboardController.indexPage.value = index;
    }

    currentIndex.value = index;
  }
}

List<NavigationRailDestination> _getDestinations() {
  return [
    NavigationRailDestination(
      icon: const Icon(Icons.home),
      label: Text(
        'Início',
        style: AppTextStyles.i.textBold
            .copyWith(fontSize: 14, color: AppColors.i.disabled),
      ),
      selectedIcon: Icon(
        Icons.home,
        color: AppColors.i.primary,
      ),
      padding: const EdgeInsets.all(0),
    ),
    NavigationRailDestination(
      icon: const Icon(Icons.event),
      label: Text(
        'Eventos',
        style: AppTextStyles.i.textBold
            .copyWith(fontSize: 14, color: AppColors.i.disabled),
      ),
      selectedIcon: Icon(
        Icons.event,
        color: AppColors.i.primary,
      ),
    ),
  ];
}
