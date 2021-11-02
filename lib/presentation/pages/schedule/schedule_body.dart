import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  _ScheduleBodyState createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  bool isRangeSelected = false;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    PickerDateRange range = args.value as PickerDateRange;
    if (range.startDate != null && range.endDate != null) {
      setState(() {
        isRangeSelected = true;
      });
    }
  }

  void _onContinue() {
    if (!isRangeSelected) {
      return;
    }
    Provider.of<RouterPageHandler>(context, listen: false)
        .show(BuddySitterLocation.resultSitters);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: Column(
        children: [
          // Popus
          Expanded(
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                firstDayOfWeek: 6,
              ),
              selectionMode: DateRangePickerSelectionMode.range,
              onSelectionChanged: _onSelectionChanged,
            ),
          )
          // Schedule
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsSuccess,
          child: AtomButton.bottom(
            icon: Icon(
              CupertinoIcons.check_mark,
              color: BuddySitterColor.light,
            ),
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: 'Continue',
              // color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) {
              if (isRangeSelected == true) {
                return BuddySitterColor.actionsSuccess;
              }
              return Colors.white54;
            },
            onPressed: _onContinue,
            onLongPress: null,
          ),
        ),
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
      ],
    );
  }
}
