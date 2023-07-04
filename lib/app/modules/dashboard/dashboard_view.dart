import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/widgets/app_navigation_rail.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            AppNavigationRail(),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // Adicione aqui a ação desejada ao pressionar o ícone do menu
                        },
                      ),
                      const Text('Título do AppBar'),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Adicione aqui a ação desejada ao pressionar o ícone de notificações
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        height: 1000,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
