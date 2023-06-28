import 'package:flutter/material.dart';
import 'package:photo_separator/app/widgets/app_navigation_rail.dart';

class AppDefaultLayout extends StatelessWidget {
  final Widget? child; 
  final bool? useDefaultNavigation;

  const AppDefaultLayout({
    Key? key,
    this.child,
    this.useDefaultNavigation = true,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (useDefaultNavigation!)
          const AppNavigationRail(),
          const VerticalDivider(width: 0),

        if (child != null) 
          Expanded(child: child!),
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