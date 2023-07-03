import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/core/helpers/form/form_treat.dart';
import 'package:photo_separator/app/core/services/auth/auth_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late FormTreat formTreat;

  late TextEditingController emailController, passwordController;

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  RxList<Map<String, String>> errorMessages = [
    {'email': ''},
    {'password': ''},
  ].obs;

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
      errorMessages: errorMessages,
    );
  }

  void changeObscure() => isObscure.value = !isObscure.value;

  Future<void> login() async {
    if (formTreat.formKey.currentState!.validate()) {
      isLoading.value = true;

      final response = await AuthService.to.login(
        emailController.text,
        passwordController.text,
      );

      if (!response) {
        Get.offAllNamed('/home');
      }

      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    formTreat.dispose();
  }
}
