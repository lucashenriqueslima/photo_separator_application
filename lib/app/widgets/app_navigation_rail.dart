import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/theme/styles/app_colors.dart';
import 'package:photo_separator/app/theme/styles/app_text_styles.dart';

class AppNavigationRail extends GetView<AppNavigationRailController> {
  const AppNavigationRail({super.key});


  @override
  Widget build(BuildContext context) {

    return Obx(
      () => 
        NavigationRail(
            selectedIconTheme: IconThemeData(color: AppColors.i.primary),
            selectedLabelTextStyle: AppTextStyles.i.textBold.copyWith(fontSize: 14),
            unselectedIconTheme: IconThemeData(color: AppColors.i.third),
            unselectedLabelTextStyle: AppTextStyles.i.textBold.copyWith(fontSize: 14),
            labelType: NavigationRailLabelType.selected,
            destinations: _getDestinations(),
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (int index) => controller.changeIndex(index),
          ),
      );
  }
}

class AppNavigationRailController extends GetxController {
  final currentIndex = 0.obs;  

  void changeIndex (int index) {
    currentIndex.value = index;
  }
}

List<NavigationRailDestination> _getDestinations () {
  return [
    NavigationRailDestination(
      icon: const Icon(Icons.home),
      label: Text('Início', style: AppTextStyles.i.textBold.copyWith(fontSize: 14),),
      selectedIcon: Icon(Icons.home, color: AppColors.i.primary,),
      padding: const EdgeInsets.all(0),
    ),
    NavigationRailDestination(
      icon: const Icon(Icons.event),
      label: Text('Eventos', style: AppTextStyles.i.textBold.copyWith(fontSize: 14),),
      selectedIcon: Icon(Icons.home, color: AppColors.i.primary,),
      padding: const EdgeInsets.all(0),
    ),
  ];
}



