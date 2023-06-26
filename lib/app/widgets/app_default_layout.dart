import 'package:flutter/material.dart';
import 'package:photo_separator/app/widgets/app_navigation_rail.dart';

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
          const AppNavigationRail(),
        if (children != null) ...children!,
      ],
    );
  }
}


List<Widget> _getPages () {
  return [
    const Center(child: Text('Home'),),
    const Center(child: Text('Event'),),
  ];
}