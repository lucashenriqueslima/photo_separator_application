import 'package:flutter/material.dart';
import 'package:photo_separator/app/core/extensions/widget_extensions.dart';
import 'package:photo_separator/app/widgets/app_navigation_rail.dart';

class AppDefaultLayout extends StatelessWidget {
  final bool? useDefaultNavigation;
  final bool useSingleChildScrollView; // Alterado para bool
  final String title;
  final String subtitle;
  final List<Widget> children;

  const AppDefaultLayout({
    Key? key,
    this.useDefaultNavigation = true,
    this.useSingleChildScrollView = true, // Alterado o valor padrão para true
    required this.title,
    required this.subtitle,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNavigationRail(),
            Expanded(
              child: useSingleChildScrollView // Verifica o valor de useSingleChildScrollView
                  ? SingleChildScrollView(
                      child:
                          buildContent(), // Extrai o conteúdo em um método separado
                    )
                  : buildContent(), // Se for false, chama diretamente o conteúdo
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    // Extrai o conteúdo para um método separado
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //let's add the navigation menu for this project
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            const CircleAvatar(
              radius: 26.0,
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        //Now let's start with the dashboard main rapports

        //Now let's set the article section
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 300.0,
            )
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        ...children
      ],
    ).paddingSymmetric(horizontal: 20.0);
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
