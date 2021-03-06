import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/list_tile.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderSelectYourPet extends ProviderSearchFilter {
  ProviderSelectYourPet(FormProvider formProvider) : super(formProvider);

  final String _key = "selected_pet";
  void selectPet(String text) {
    BuddySitterData().state.setKey(_key, text);
  }

  bool isSelected() {
    var map = BuddySitterData().state.syncGet();
    return map.containsKey(_key);
  }

  @override
  BuddySitterAction action(BuildContext context) {
    return BuddySitterAction(
      icon: Icon(
        Icons.check,
        color: BuddySitterColor.actionsSuccess,
      ),
      onPressed: () {
        if (!isSelected()) {
          return;
        }
        Provider.of<RouterPageHandler>(context, listen: false)
            .show(BuddySitterLocation.selectYourService);
      },
      text: 'Continue',
    );
  }

  @override
  Future<List<ItemListItem>> get data async {
    List<ItemListItem> value = await Future<List<ItemListItem>>.delayed(
      const Duration(seconds: 2),
      () => [
        ItemListItem(
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjh5E6lDdlw5R7h6tiwcvuly5qfbRnrVV6tKrGc-bb1Zq-Mu1kbcwPgFIN0w_jKsAFbNo&usqp=CAU',
          title: 'Buster',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {
              selectPet("Buster");
            },
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: 'Weight: 40lbs',
        ),
        ItemListItem(
          image:
              'https://t3.ftcdn.net/jpg/02/95/94/94/360_F_295949484_8BrlWkTrPXTYzgMn3UebDl1O13PcVNMU.jpg',
          title: 'Buddy',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {
              selectPet("Buddy");
            },
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: 'Weight: 20lbs',
        ),
      ],
    );
    if (formProvider.entries.isNotEmpty &&
        formProvider.entries.values.first.value != null) {
      final String filter = formProvider.entries.values.first.value as String;
      value.removeWhere(
        (element) =>
            !(element.content.toLowerCase().contains(filter.toLowerCase()) ||
                element.title.toLowerCase().contains(filter.toLowerCase())),
      );
    }
    return value;
  }
}
