import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/core/helpers/form/form_treat.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late FormTreat formTreat;

  late TextEditingController emailController, passwordController;

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  final RxMap<String, String> errorTexts = {'email': '', 'password': ''}.obs;

  final RxBool isLoading = false.obs;
  final RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();

    formTreat = FormTreat(
      formKey: formKey,
      textEditingControllers: [
        emailController = TextEditingController(),
        passwordController = TextEditingController(),
      ],
      focusNodes: focusNodes,
      errorTexts: errorTexts,
    );
  }

  void changeObscure() => isObscure.value = !isObscure.value;

  Future<void> login() async {
    if (!formTreat.validate()) return;

    isLoading.value = true;

    final response = await AuthService.to.login(
      emailController.text,
      passwordController.text,
    );

    isLoading.value = false;

    if (!formTreat.apiValidate(response)) return;

    Get.offAllNamed(Routes.DASHBOARD);
  }

  @override
  void onClose() {
    super.onClose();
    formTreat.dispose();
  }
}
