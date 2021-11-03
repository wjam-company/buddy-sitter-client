import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BuddySitterAction actionEmail(BuildContext context) {
  return BuddySitterAction(
    onPressed: () {},
    icon: Icon(
      CupertinoIcons.captions_bubble,
      color: BuddySitterColor.actionsLog,
    ),
  );
}
