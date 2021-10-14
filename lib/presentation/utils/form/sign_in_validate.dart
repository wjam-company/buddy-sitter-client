import 'package:buddy_sitter/data/static/forms/sign_in_validations.dart';
import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';

class SignInValidator {
  static String mail = 'mail';
  static String password = 'password';

  static ValidationItem validEmail(
      ValidationItem prevValidation, String value) {
    if (!value.contains(SignInDataValidator.mailAt.valid)) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.mailAt.message,
          type: FormError.error,
        ),
      );
    }

    if (value.contains(SignInDataValidator.mailSpace.valid)) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.mailSpace.message,
          type: FormError.error,
        ),
      );
    }

    if (!value.contains(RegExp(SignInDataValidator.mailDomain.valid))) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.mailDomain.message,
          type: FormError.warning,
        ),
      );
    }

    return prevValidation;
  }

  static ValidationItem validPassword(
    ValidationItem prevValidation,
    String value,
  ) {
    if (!value.contains(RegExp(SignInDataValidator.passwordLowercase.valid))) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.passwordLowercase.message,
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(SignInDataValidator.passwordNumeric.valid))) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.passwordNumeric.message,
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(SignInDataValidator.passwordSpecial.valid))) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.passwordSpecial.message,
          type: FormError.warning,
        ),
      );
    }

    if (!value.contains(RegExp(SignInDataValidator.passwordMin8.valid))) {
      prevValidation.errors.add(
        FormError(
          message: SignInDataValidator.passwordMin8.message,
          type: FormError.warning,
        ),
      );
    }

    return prevValidation;
  }
}
