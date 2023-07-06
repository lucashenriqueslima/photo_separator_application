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
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            AppNavigationRail(),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.menu, size: 30),
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
                            const Text('asdasd')
                          ],
                        ),
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

List<Widget> _getPages() {
  return [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Event'),
    ),
  ];
}
