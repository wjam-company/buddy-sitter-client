import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderSelectYourPet with ChangeNotifier {
  final FormProvider formProvider;

  ProviderSelectYourPet(this.formProvider) {
    formProvider.addListener(notifyListeners);
  }

  void filter() {}

  BuddySitterAction get action {
    return BuddySitterAction(
      icon: Icon(
        Icons.check,
        color: BuddySitterColor.actionsSuccess,
      ),
      onPressed: () {
        print('save the model of pet');
      },
      text: 'Continue',
    );
  }

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
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: 'Deserunt aqui Buster',
        ),
        ItemListItem(
          image:
              'https://t3.ftcdn.net/jpg/02/95/94/94/360_F_295949484_8BrlWkTrPXTYzgMn3UebDl1O13PcVNMU.jpg',
          title: 'Magna',
          action: BuddySitterAction(
            text: 'Select',
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.check_mark_circled,
              color: BuddySitterColor.light,
            ),
          ),
          content: 'Deserunt aqui magna',
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
