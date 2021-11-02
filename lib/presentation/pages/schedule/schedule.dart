import 'package:buddy_sitter/presentation/pages/schedule/schedule_body.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './provider.dart';
import '../interfaces/interfaces.dart';

class Schedule extends BuddySitterPageProvider<ProviderSchedule> {
  const Schedule({Key? key}) : super(key: key);

  @override
  ProviderSchedule provider(BuildContext context) => ProviderSchedule();

  @override
  // ignore: avoid_renaming_method_parameters
  Widget appBarTitle(_) => AtomText.content(
        text: 'Schedule',
        color: BuddySitterColor.dark.brighten(0.3),
      );

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const ScheduleBody();
}
