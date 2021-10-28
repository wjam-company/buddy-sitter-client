import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../interfaces/interfaces.dart';
import './provider.dart';

class Schedule extends BuddySitterPageProvider<ProviderSchedule> {
  const Schedule({Key? key}) : super(key: key);

  @override
  ProviderSchedule provider(BuildContext context) => ProviderSchedule();

  @override
  bool get haveAppBar => false;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const Body();
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: Column(
        children: [
          // Popus
          ListTile(
            //contentPadding: EdgeInsets.zero,
            leading: AtomText.subheading(
              text: 'Schedule',
              padding: EdgeInsets.zero,
            ),
          ),
          Expanded(
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 6,
              ),
              selectionMode: DateRangePickerSelectionMode.range,
            ),
          )
          // Schedule
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            icon: Icon(
              CupertinoIcons.xmark,
              color: BuddySitterColor.actionsError,
            ),
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: 'Cancel',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: () {
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.resultSitters);
            },
            onLongPress: null,
          ),
        ),
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            icon: Icon(
              CupertinoIcons.check_mark,
              color: BuddySitterColor.actionsSuccess,
            ),
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: 'Continue',
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: () {
              Provider.of<RouterPageHandler>(context, listen: false)
                  .show(BuddySitterLocation.resultSitters);
            },
            onLongPress: null,
          ),
        ),
      ],
    );
  }
}
