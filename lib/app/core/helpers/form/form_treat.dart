import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FormTreat {
  final GlobalKey<FormState> formKey;
  final List<TextEditingController> textEditingControllers;
  final List<FocusNode> focusNodes;
  final RxList<Map<String, String>>? errorMessages;

  FormTreat({
    required this.formKey,
    required this.textEditingControllers,
    required this.focusNodes,
    this.errorMessages,
  });

  void dispose() {
    for (final controller in textEditingControllers) {
      controller.dispose();
    }

    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}
