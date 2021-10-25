import 'package:buddy_sitter/presentation/utils/form/exporer_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/utils/theme/text.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/snack.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/list_tile.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../interfaces/interfaces.dart';

class ItemListItem {
  final String image;
  final String title;
  final BuddySitterAction action;
  final String content;

  ItemListItem({
    required this.image,
    required this.title,
    required this.action,
    required this.content,
  });
}

class SearchFilter<T extends ChangeNotifier>
    extends BuddySitterPageProvider<T> {
  const SearchFilter({Key? key}) : super(key: key);

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
            MoleculeInput.text(
              autofocus: true,
              entry: ExploreValidator.search,
              controler: validators.valid(
                ExploreValidator.search,
                validator: ExploreValidator.validSearch,
              ),
              text: appBarAction(context, currentProvider).text,
            ),
          ],
        ),
        Positioned(
          right: BuddySitterMeasurement.sizeHalf,
          top: BuddySitterMeasurement.sizeHalf,
          child: AtomButton.cicle(
            onPressed: appBarAction(context, currentProvider).onPressed,
            onLongPress: appBarAction(context, currentProvider).onLongPress,
            height: (BuddySitterMeasurement.sizeHigh) -
                ((BuddySitterText.content.fontSize as double) / 2),
            icon: appBarAction(context, currentProvider).icon,
          ),
        ),
      ],
    );
  }
}

class BodySearchFilter extends StatelessWidget {
  const BodySearchFilter({
    Key? key,
  }) : super(key: key);

  Future<List<ItemListItem>> listData(BuildContext context) {
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
      child: FutureBuilder<List<ItemListItem>>(
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
                return MoleculeListTile(
                  image: snapshot.data[index].image,
                  title: snapshot.data[index].title,
                  content: snapshot.data[index].content,
                  action: snapshot.data[index].action,
                );
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
