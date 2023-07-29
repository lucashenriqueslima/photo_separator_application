import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AppDefaultLayout(
      title: 'Início',
      subtitle: 'Início',
      children: [
        Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
