import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
//        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

class SignInValidator {
  static String mail = 'mail';
  static String password = 'password';

  static ValidationItem validEmail(
      ValidationItem prevValidation, String value) {
    if (value.isEmpty) {
      return prevValidation;
    }
    if (!value.contains('@')) {
      prevValidation.errors.add(
        FormError(
          message: 'Add the at sign of the mail',
          type: FormError.error,
        ),
      );
    }
    if (value.contains(' ')) {
      prevValidation.errors.add(
        FormError(
          message: 'Please remove the blanks',
          type: FormError.error,
        ),
      );
    }
    if (!RegExp(r".+\.[a-zA-Z]+").hasMatch(value)) {
      prevValidation.errors.add(
        FormError(
          message: 'You need to add the domain EJ: .com',
          type: FormError.warning,
        ),
      );
    }

    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      prevValidation.errors.add(
        FormError(
          message: 'Email valid',
          type: FormError.success,
        ),
      );
    }
    return prevValidation;
  }

  static ValidationItem validPassword(
    ValidationItem prevValidation,
    String value,
  ) {
    if (value.isEmpty) {
      return prevValidation;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Minimum 1 uppercase',
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Minimum 1 lowercase',
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Minimum 1 Numeric Number',
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Minimum 1 Special Character',
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(r'.{8,}'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Minimum 8 Characters',
          type: FormError.warning,
        ),
      );
    }

    if (prevValidation.errors.isEmpty) {
      prevValidation.errors.add(
        FormError(
          message: 'Password valid',
          type: FormError.success,
        ),
      );
    }

    return prevValidation;
  }
}
