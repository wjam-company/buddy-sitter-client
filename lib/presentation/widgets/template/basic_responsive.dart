import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicResponsive extends StatelessWidget {
  final Widget child;
  const BasicResponsive({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MediaHandler>(context);
    return SafeArea(
      child: MediaHandler.requiredSingle(
        mobile: SizedBox(
          child: child,
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.2,
            ),
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.6,
              child: child,
            ),
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.2,
            ),
          ],
        ),
      ), // MediaHandler.requiredSingle
    );
  }
}
