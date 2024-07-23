import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Remove any non-numeric characters
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Formatting logic with slashes
    if (text.length > 2 && text.length <= 4) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    } else if (text.length > 4 && text.length <= 8) {
      text =
          '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4)}';
    } else if (text.length > 8) {
      text =
          '${text.substring(0, 2)}/${text.substring(2, 4)}/${text.substring(4, 8)}';
    }
    if (text.length >= 2) {
      int day = int.tryParse(text.substring(0, 2)) ?? 0;
      if (day < 1 || day > 31) {
        text = oldValue.text;
      }
    }
    if (text.length >= 5) {
      int month = int.tryParse(text.substring(3, 5)) ?? 0;
      if (month < 1 || month > 12) {
        text = oldValue.text;
      }
    }
    // Returning the formatted value
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
