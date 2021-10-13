import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class AtomError extends StatelessWidget {
  final BuddySitterError error;
  const AtomError({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          child: FormError.iconOf(error.type),
          padding: BuddySitterMeasurement.marginsLeast
              .copyWith(left: BuddySitterMeasurement.sizeHalf),
        ),
        AtomText.caption(
          text: error.message,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
