import 'package:buddy_sitter/presentation/pages/interfaces/interfaces.dart';
import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/exporer_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/assets/image.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/snack.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostSitterItem {
  final String image;
  final String title;
  final BuddySitterAction action;
  final String content;
  final int imageType;

  PostSitterItem({
    required this.image,
    required this.title,
    required this.action,
    required this.content,
    this.imageType = AtomImage.typeNetwork,
  });
}

class ProviderPostList with ChangeNotifier {
  final FormProvider formProvider;

  ProviderPostList(this.formProvider) {
    formProvider.addListener(notifyListeners);
  }

  BuddySitterAction action(BuildContext context) {
    throw UnimplementedError();
  }

  Future<List<PostSitterItem>> get data async {
    throw UnimplementedError();
  }
}

class SearchSitter<T extends ProviderPostList>
    extends BuddySitterPageProvider<T> {
  const SearchSitter({Key? key}) : super(key: key);

  BuddySitterAction appBarAction(BuildContext context, T currentProvider) {
    throw UnimplementedError();
  }

  @override
  FormProvider get appBarProvider {
    return FormProvider([
      ExploreValidator.search,
    ]);
  }

  @override
  bool get haveAppBarProvider => true;

  @override
  Widget appBarTitleProvider(
      BuildContext context, T currentProvider, FormProvider validators) {
    return Stack(
      children: [
        OrganismForm.column(
          padding: false,
          valid: false,
          provider: validators,
          fields: [
            SizedBox(
              height: (BuddySitterMeasurement.sizeHigh) -
                  ((BuddySitterText.content.fontSize as double) / 2),
              child: MoleculeInput.text(
                padding: false,
                entry: ExploreValidator.search,
                controler: validators.valid(
                  ExploreValidator.search,
                  validator: ExploreValidator.validSearch,
                ),
                text: appBarAction(context, currentProvider).text,
              ),
            ),
          ],
        ),
        Positioned(
          right: BuddySitterMeasurement.sizeHalf,
          child: Center(
            child: AtomButton.cicle(
              onPressed: appBarAction(context, currentProvider).onPressed,
              onLongPress: appBarAction(context, currentProvider).onLongPress,
              height: (BuddySitterMeasurement.sizeHigh) -
                  ((BuddySitterText.content.fontSize as double) / 2),
              icon: appBarAction(context, currentProvider).icon,
            ),
          ),
        ),
      ],
    );
  }
}

class BodySearchSitter extends StatelessWidget {
  const BodySearchSitter({
    Key? key,
  }) : super(key: key);

  Future<List<PostSitterItem>> listData(BuildContext context) {
    throw UnimplementedError();
  }

  String listTitle(BuildContext context) {
    throw UnimplementedError();
  }

  BuddySitterAction action(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: FutureBuilder<List<PostSitterItem>>(
        future: listData(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    //contentPadding: EdgeInsets.zero,
                    leading: AtomText.subheading(
                      text: listTitle(context),
                      padding: EdgeInsets.zero,
                    ),
                  );
                }
                index -= 1;
                return OrganismCard.simple(
                  actionLeft: BuddySitterAction(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.captions_bubble,
                      color: BuddySitterColor.actionsLog,
                    ),
                  ),
                  actionRight: BuddySitterAction(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.heart,
                      color: BuddySitterColor.complementaryRed,
                    ),
                  ),
                  content:
                      'Eu adipisicing eu ex sit non in nulla incididunt adipisicing culpa incididunt elit. Ut cillum incididunt anim velit aute est duis esse esse et est.',
                  image:
                      'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
                  name: 'Juanita',
                  profile:
                      'https://media.istockphoto.com/photos/young-redhead-woman-hug-her-small-mixedbreed-dog-picture-id485251750?b=1&k=20&m=485251750&s=170667a&w=0&h=v7Wf4tPLnkGl_yZxXiWyjzKYdLgirM_zieYBLilAM5c=',
                );
                /*  data: snapshot.data[index],*/
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: AtomSnack(
                title: 'Connection error',
                caption: 'Ups your connection has an error',
                icon: Icon(CupertinoIcons.exclamationmark_circle),
              ),
            );
          } else {
            return Center(
              child: SpinKitPumpingHeart(
                color: BuddySitterColor.complementaryRed,
                size: BuddySitterMeasurement.sizeHigh,
                duration: const Duration(milliseconds: 1200),
              ),
            );
          }
        },
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            icon: action(context).icon,
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: action(context).text,
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: action(context).onPressed,
            onLongPress: action(context).onLongPress,
          ),
        ),
      ],
    );
  }
}
