import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/core/helpers/constants/constants.dart';
import 'package:photo_separator/app/core/helpers/responsive/responsive.dart';
import 'package:photo_separator/app/widgets/app_side_menu.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: AppSideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SafeArea(
                child: SingleChildScrollView(
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        height: defaultPadding,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
