import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';

class ExploreValidator {
  static String search = 'search';

  static ValidationItem validSearch(
      ValidationItem prevValidation, String value) {
    if (!value.contains(RegExp('{0, 255}'))) {
      prevValidation.errors.add(
        FormError(
          message: 'Maximun 254 characters',
          type: FormError.success,
        ),
      );
    }

    return prevValidation;
  }
}
