import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSideMenu extends StatelessWidget {
  AppSideMenu({super.key});

  final controller = Get.put(SideMenuController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.png'),
          ),
          DrawerListTile(
            indexPage: 0,
            title: "Início",
            iconData: Icons.home,
            press: () => controller._selectedIndex.value = 0,
          ),
          DrawerListTile(
            indexPage: 1,
            title: "Eventos",
            iconData: Icons.event,
            press: () => controller._selectedIndex.value = 1,
          ),
        ],
      ),
    );
  }
}

class SideMenuController extends GetxController {
  final _selectedIndex = 0.obs;
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.indexPage,
    required this.title,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  final int indexPage;
  final String title;
  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        color: Colors.white54,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
