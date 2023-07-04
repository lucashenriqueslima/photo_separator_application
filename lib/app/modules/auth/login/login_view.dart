import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/core/extensions/size_extensions.dart';
import 'package:photo_separator/app/core/extensions/widget_extensions.dart';
import 'package:photo_separator/app/core/helpers/form/form_utils.dart';
import 'package:photo_separator/app/core/helpers/form/form_validators.dart';
import 'package:photo_separator/app/widgets/app_button.dart';
import 'package:photo_separator/app/widgets/app_text_form_field.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Obx(
                    () => AppTextFormField(
                      controller: controller.emailController,
                      focusNode: controller.focusNodes[0],
                      nextFocusNode: controller.focusNodes[1],
                      validator: (value) => FormValidators.isEmail(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'E-mail',
                        errorText: FormUtils.getErrorText(
                            controller.errorTexts['email']),
                      ),
                    ).paddingBottom(20.0),
                  ),
                  Obx(
                    () => AppTextFormField(
                      controller: controller.passwordController,
                      focusNode: controller.focusNodes[1],
                      onFieldSubmitted: (_) => controller.login(),
                      // validator: (value) => FormValidators.isEmpty(value),
                      obscureText: controller.isObscure.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Senha',
                          errorText: FormUtils.getErrorText(
                              controller.errorTexts['password']),
                          suffixIcon: IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () => controller.changeObscure(),
                            icon: controller.isObscure.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          )),
                    ).paddingBottom(30.0),
                  ),
                  Obx(
                    () => AppButton(
                      label: 'Entrar',
                      onPressed: controller.login,
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 4.0.wp),
            ),
          ),
        ),
      ),
    );
  }
}
