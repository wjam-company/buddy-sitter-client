import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganismBarMenu extends StatelessWidget {
  const OrganismBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoleculeRowFLex.action(
      height: BuddySitterMeasurement.sizeHalf * 3,
      actions: [
        BuddySitterAction(
          onPressed: () =>
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.home, change: true),
          icon: Icon(
            CupertinoIcons.home,
            color: BuddySitterColor.actionsLog,
          ),
        ),
        BuddySitterAction(
          onPressed: () =>
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.explore, change: true),
          icon: Icon(
            CupertinoIcons.search,
            color: BuddySitterColor.actionsLog,
          ),
        ),
        BuddySitterAction(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.calendar,
            color: BuddySitterColor.actionsLog,
          ),
        ),
      ],
    );
  }
}
