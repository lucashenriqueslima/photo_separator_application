import 'package:flutter/material.dart';
import 'package:photo_separator/app/theme/styles/app_colors.dart';
import 'package:photo_separator/app/theme/styles/app_text_styles.dart';

class AppDefaultLayout extends StatelessWidget {
  final List<Widget>? children; 
  final String? activeRoute;
  final bool? useDefaultNavigation;

  const AppDefaultLayout({
    Key? key,
    
    this.children,
    this.activeRoute,
    this.useDefaultNavigation = true,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (useDefaultNavigation!)
          NavigationRail(
            selectedIconTheme: IconThemeData(color: AppColors.i.primary),
            selectedLabelTextStyle: AppTextStyles.i.textBold.copyWith(fontSize: 14),
            unselectedIconTheme: IconThemeData(color: AppColors.i.third),
            unselectedLabelTextStyle: AppTextStyles.i.textBold.copyWith(fontSize: 14),
            labelType: NavigationRailLabelType.selected,
            destinations: _getDestinations(),
            selectedIndex: 0,
            
            onDestinationSelected: (int index) {
              print(index);
            },
          ),
        if (children != null) ...children!,
      ],
    );
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