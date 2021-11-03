import 'package:buddy_sitter/data/static/mock/service_data.dart';
import 'package:buddy_sitter/presentation/pages/interfaces/list_resoult.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/card_service.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderSearchSitter extends ProviderPostList {
  ProviderSearchSitter(FormProvider formProvider) : super(formProvider);

  final Icon leftIcon = Icon(
    CupertinoIcons.equal_square,
    color: BuddySitterColor.actionsLog,
  );

  final Icon rightIcon = Icon(
    CupertinoIcons.calendar_badge_plus,
    color: BuddySitterColor.complementaryRed,
  );

  @override
  BuddySitterAction action(BuildContext context) {
    return BuddySitterAction(
      icon: Icon(
        Icons.check,
        color: BuddySitterColor.actionsSuccess,
      ),
      onPressed: () {
        //Provider.of<RouterPageHandler>(context, listen: false)
        //    .show(BuddySitterLocation.selectYourService);
      },
      text: 'Continue',
    );
  }

  @override
  Future<List<dynamic>> get data async {
    Map map = BuddySitterData().state.syncGet();
    print(map);
    var list = ServiceData.listFromMap(map["pending"]);

    List<dynamic> value = await Future<List<ServiceCard>>.delayed(
        const Duration(seconds: 0),
        () => list
            .map<ServiceCard>(
              (serviceData) => ServiceCard(service: serviceData),
            )
            .toList());
    if (formProvider.entries.isNotEmpty &&
        formProvider.entries.values.first.value != null) {
      final String filter = formProvider.entries.values.first.value as String;
      value.removeWhere(
        (element) =>
            !(element.content.toLowerCase().contains(filter.toLowerCase()) ||
                element.name.toLowerCase().contains(filter.toLowerCase())),
      );
    }
    return value;
  }
}
