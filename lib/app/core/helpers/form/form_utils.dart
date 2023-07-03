import 'package:flutter/cupertino.dart';

class FormUtils {
  static void changeFieldFocus(FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    nextFocus.requestFocus();
  }
}
