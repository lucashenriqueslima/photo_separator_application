import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/modules/event/event_view.dart';
import 'package:photo_separator/app/modules/home/home_view.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppDefaultLayout(
          title: controller.titles[controller.indexPage.value],
          subtitle: controller.subtitles[controller.indexPage.value],
          useSingleChildScrollView: false,
          children: [
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.indexPage.value,
                  children: const [
                    HomeView(),
                    EventView(),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

getPages() {
  return [const HomeView(), const EventView()];
}
