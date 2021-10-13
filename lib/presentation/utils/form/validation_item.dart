import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:flutter/material.dart';

class FormError {
  final String message;
  int type;
  static final List<Icon> _icons = List.unmodifiable([
    Icon(
      Icons.warning_amber_outlined,
      color: BuddySitterColor.actionsWarning,
      size: BuddySitterMeasurement.sizeHalf * .75,
    ),
    Icon(
      Icons.highlight_off_outlined,
      color: BuddySitterColor.actionsError,
      size: BuddySitterMeasurement.sizeHalf * .75,
    ),
    Icon(
      Icons.error_outline,
      color: BuddySitterColor.actionsLog,
      size: BuddySitterMeasurement.sizeHalf * .75,
    ),
  ]);

  static int warning = 0;
  static int error = 1;
  static int log = 2;
  static Icon iconOf(int type) => _icons[type];

  FormError({required this.message, required this.type});
}

class ValidationItem {
  final String? value;
  final List<FormError> errors = [];

  ValidationItem({this.value});
}
