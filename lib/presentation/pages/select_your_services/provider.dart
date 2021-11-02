import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderSelectYourService extends ProviderSearchFilter {
  ProviderSelectYourService(FormProvider formProvider) : super(formProvider);

  final String _key = "selected_service";
  void select(String text) {
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
        print(isSelected());
        if (!isSelected()) {
          return;
        }
        Provider.of<RouterPageHandler>(context, listen: false)
            .show(BuddySitterLocation.schedule);
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
          image: 'assets/image/12.png',
          imageType: AtomImage.typeAsset,
          title: 'Walk',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {
              select("walk");
            },
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          image: 'assets/image/11.png',
          imageType: AtomImage.typeAsset,
          title: 'Sleepover',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {
              select("sleepover");
            },
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          image: 'assets/image/10.png',
          imageType: AtomImage.typeAsset,
          title: 'Special medical care',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
        ),
        ItemListItem(
          imageType: AtomImage.typeAsset,
          image: 'assets/image/9.png',
          title: 'Daycare',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {
              select("Daycare");
            },
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: '',
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
