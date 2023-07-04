import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/core/client/http_client.dart';

class FormTreat {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> textEditingControllers;
  final List<FocusNode> focusNodes;
  final RxMap<String, String>? errorTexts;

  FormTreat({
    required this.formKey,
    required this.textEditingControllers,
    required this.focusNodes,
    this.errorTexts,
  });

  void clearErrors() {
    if (errorTexts == null) return;

    errorTexts!.forEach((key, value) {
      errorTexts![key] = '';
    });
  }

  bool validate() {
    // clearErrors();

    if (formKey.currentState!.validate()) return true;

    return false;
  }

  bool apiValidate(ApiResponse<dynamic> response, {bool setErrors = true}) {
    if (response.success) return true;

    clearErrors();

    if (!setErrors ||
        response.statusCode != 422 ||
        response.data['errors'] == null ||
        errorTexts == null) {
      return false;
    }

    response.data['errors'].forEach((key, value) {
      if (errorTexts?[key] != null) {
        print(response.data['errors']?[key]?.first);
        print(key);
        errorTexts![key] = response.data['errors'][key].first;
      }
    });

    return false;
  }

  void dispose() {
    for (final controller in textEditingControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}
