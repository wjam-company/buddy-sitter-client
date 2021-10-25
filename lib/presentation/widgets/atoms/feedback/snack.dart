import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

class AtomSnack extends StatelessWidget {
  final String caption;
  final String title;
  final Icon icon;
  final void Function()? action;
  const AtomSnack({
    Key? key,
    required this.caption,
    required this.title,
    required this.icon,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: BuddySitterMeasurement.sizeHalf / 2,
      ),
      child: ClipRRect(
        borderRadius: BuddySitterMeasurement.borderRadiusHalf,
        child: Material(
          color: BuddySitterColor.actionsLog.brighten(.3),
          child: InkWell(
            splashColor: /* splashColorHandler != null
                ? splashColorHandler!(<MaterialState>{})
                : */
                Color.lerp(
              Colors.transparent,
              BuddySitterColor.light,
              0.2,
            ),
            onTap: action,
            child: Padding(
              padding: EdgeInsets.all(BuddySitterMeasurement.sizeHalf),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtomText.caption(
                        text: caption,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                      AtomText.subheading(
                        text: title,
                        padding: EdgeInsets.zero,
                        color: BuddySitterColor.light,
                      ),
                    ],
                  ),
                  const Spacer(),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
