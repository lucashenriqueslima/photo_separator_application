import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FormValidators {
  static String? isEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório!';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Favor insira um email válido!';
    }
    return null;
  }

  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória!';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de Nº de telefone é obrigatório.';
    }
    if (value.length <= 14) {
      return 'Favor insira um número de telefone válido!';
    }
    return null;
  }

  static String? cpf(String value) {
    value = value.replaceAll(RegExp('[^0-9]'), '');

    if (value.length != 11) return 'CPF inválido.';

    if (RegExp(r'^(\d)\1*$').hasMatch(value)) return 'CPF inválido.';

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(value[i]) * (10 - i);
    }

    int digit1 = (sum * 10) % 11;
    if (digit1 == 10) digit1 = 0;

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(value[i]) * (11 - i);
    }
    int digit2 = (sum * 10) % 11;
    if (digit2 == 10) digit2 = 0;

    // Return null if both verification digits are correct
    if (digit1 == int.parse(value[9]) && digit2 == int.parse(value[10])) {
      return null;
    } else {
      return 'CPF inválido.';
    }
  }

  static String? address(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  static String? cep(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de CEP é obrigatório.';
    }
    if (value.length <= 8) {
      return 'Favor insira um CEP válido!';
    }
    return null;
  }

  static String? emptyInputs(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return 'Campo $label é obrigatório.';
    }
    return null;
  }

  static String? hasOnlyNumbers(String? value) {
    if (!RegExp(r'^[0-9]+$').hasMatch(value!) || value.length <= 2) {
      return 'Favor use um número válido!';
    }

    if (value.isEmpty) {
      return 'Favor preencher o campo!';
    }

    return null;
  }

  static String? confirmInputs(
      String? value, String? confirmValue, String? label) {
    if (value == null || value.isEmpty) {
      return 'Campo de confirmar $label é obrigatório.';
    }
    if (value != confirmValue) {
      return 'Campos de confirmar $label e $label não confere.';
    }
    return null;
  }
}
