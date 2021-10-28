import 'package:buddy_sitter/presentation/pages/interfaces/list_resoult.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
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
  Future<List<PostSitterItem>> get data async {
    List<PostSitterItem> value = await Future<List<PostSitterItem>>.delayed(
      const Duration(seconds: 0),
      () => [
        PostSitterItem(
          image:
              'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
          name: 'Emma',
          actionLeft: BuddySitterAction(
            onPressed: () {},
            icon: leftIcon,
          ),
          actionRight: BuddySitterAction(
            onPressed: () {},
            icon: rightIcon,
          ),
          content:
              'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
          profile:
              'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
        ),
        PostSitterItem(
          image:
              'https://www.cfsph.iastate.edu/Assets/Course-CA-Zoonoses-600x600.jpg',
          name: 'Ava and Noah',
          actionLeft: BuddySitterAction(
            onPressed: () {},
            icon: leftIcon,
          ),
          actionRight: BuddySitterAction(
            onPressed: () {},
            icon: rightIcon,
          ),
          content:
              'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
          profile:
              'https://www.cfsph.iastate.edu/Assets/Course-CA-Zoonoses-600x600.jpg',
        ),
        PostSitterItem(
          image:
              'https://post.healthline.com/wp-content/uploads/2021/06/Man-laying-on-the-grass-and-playing-with-the-dog-732x549-thumbnail.jpg',
          name: 'Liam',
          actionLeft: BuddySitterAction(
            onPressed: () {},
            icon: leftIcon,
          ),
          actionRight: BuddySitterAction(
            onPressed: () {},
            icon: rightIcon,
          ),
          content:
              'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
          profile:
              'https://post.healthline.com/wp-content/uploads/2021/06/Man-laying-on-the-grass-and-playing-with-the-dog-732x549-thumbnail.jpg',
        ),
        PostSitterItem(
          image:
              'https://media.istockphoto.com/photos/love-you-picture-id1224405573?b=1&k=20&m=1224405573&s=170667a&w=0&h=tF2crXTAAHxyVzO3Ogtw4fGr36GKVw_zKNb2IXFw-Z8=',
          name: 'Charlotte',
          actionLeft: BuddySitterAction(
            onPressed: () {},
            icon: leftIcon,
          ),
          actionRight: BuddySitterAction(
            onPressed: () {},
            icon: rightIcon,
          ),
          content:
              'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
          profile:
              'https://media.istockphoto.com/photos/love-you-picture-id1224405573?b=1&k=20&m=1224405573&s=170667a&w=0&h=tF2crXTAAHxyVzO3Ogtw4fGr36GKVw_zKNb2IXFw-Z8=',
        ),
        PostSitterItem(
          image:
              'https://www.thesimpledollar.com/wp-content/uploads/2020/06/english.jpg',
          name: 'Olivia',
          actionLeft: BuddySitterAction(
            onPressed: () {},
            icon: leftIcon,
          ),
          actionRight: BuddySitterAction(
            onPressed: () {},
            icon: rightIcon,
          ),
          content:
              'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
          profile:
              'https://www.thesimpledollar.com/wp-content/uploads/2020/06/english.jpg',
        ),
      ],
    );
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
