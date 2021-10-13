import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
import 'package:flutter/foundation.dart';

class SignInValidator {
  static String mail = 'mail';
  static String password = 'password';
  static ValidationItem email(ValidationItem prevValidation, String value) {
    if (value.isEmpty) {
      prevValidation.errors.add(FormError(
        message: 'Your need adding',
        type: FormError.error,
      ));
    }
    if (!value.contains('@')) {
      prevValidation.errors.add(FormError(
        message: 'Your need adding the character @',
        type: FormError.error,
      ));
    }
    return prevValidation;
  }
}
