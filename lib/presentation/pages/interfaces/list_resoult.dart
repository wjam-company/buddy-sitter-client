import 'package:buddy_sitter/presentation/pages/interfaces/interfaces.dart';
import 'package:buddy_sitter/presentation/utils/form/exporer_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/snack.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/sitter_card.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/basic_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class PostSitterItem {
  final String name;
  final String image;
  final String profile;
  final String content;
  final BuddySitterAction actionLeft;
  final BuddySitterAction actionRight;

  PostSitterItem({
    required this.image,
    required this.content,
    required this.name,
    required this.profile,
    required this.actionLeft,
    required this.actionRight,
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

  Future<List<SitterCard>> get data async {
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
              circleColor: null,
              dotsColor: null,
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

  Future<List<SitterCard>> listData(BuildContext context) {
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
    return BasicResponsive(
      child: FutureBuilder<List<SitterCard>>(
        future: listData(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          Provider.of<MediaHandler>(context);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    leading: AtomText.subheading(
                      text: listTitle(context),
                      padding: EdgeInsets.zero,
                    ),
                  );
                }
                index -= 1;
                return OrganismCard.simple(
                  actionLeft: snapshot.data[index].actionLeft,
                  actionRight: snapshot.data[index].actionRight,
                  content: snapshot.data[index].content,
                  image: snapshot.data[index].image,
                  name: snapshot.data[index].name,
                  profile: snapshot.data[index].profile,
                  children: snapshot.data[index].children,
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
    );
  }
}
