import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/themes/themes.dart';
import 'app/core/services/storage/storage_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Initialize the local storage
  await GetStorage.init();

  // Initialize the storage service
  await Get.putAsync(() => StorageService().init());

  // Initialize the auth service
  await Get.putAsync(() => AuthService().init());
  
  // Set the status bar color to transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      theme: Themes.lightTheme,
    ),
  );
}
