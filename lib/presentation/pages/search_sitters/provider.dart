import 'package:buddy_sitter/presentation/pages/interfaces/list_resoult.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProviderSearchSitter extends ProviderPostList {
  ProviderSearchSitter(FormProvider formProvider) : super(formProvider);

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
  Future<List<PostSitterItem>> get data async {
    List<PostSitterItem> value = await Future<List<PostSitterItem>>.delayed(
      const Duration(seconds: 2),
      () => [
        PostSitterItem(
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
        PostSitterItem(
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
