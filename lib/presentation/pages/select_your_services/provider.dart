import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderSelectYourService extends ProviderSearchFilter {
  ProviderSelectYourService(FormProvider formProvider) : super(formProvider);

  @override
  BuddySitterAction action(BuildContext context) {
    return BuddySitterAction(
      icon: Icon(
        Icons.check,
        color: BuddySitterColor.actionsSuccess,
      ),
      onPressed: () {
        print('save the model of service');
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
