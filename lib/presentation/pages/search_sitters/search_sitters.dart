import 'package:buddy_sitter/presentation/pages/interfaces/list_resoult.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider.dart';

class ResultSitters extends SearchSitter<ProviderSearchSitter> {
  const ResultSitters({Key? key}) : super(key: key);

  @override
  ProviderSearchSitter providerWithAppBar(
          BuildContext context, FormProvider formProvider) =>
      ProviderSearchSitter(formProvider);

  @override
  BuddySitterAction appBarAction(context, currentProvider) => BuddySitterAction(
        icon: Icon(
          Icons.search,
          color: BuddySitterColor.dark.brighten(.5),
        ),
        text: 'Search',
      );

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const Body();
}

class Body extends BodySearchSitter {
  @override
  Future<List<PostSitterItem>> listData(BuildContext context) async {
    ProviderSearchSitter providerSelectYourPet =
        Provider.of<ProviderSearchSitter>(context);
    return await providerSelectYourPet.data;
  }

  @override
  String listTitle(BuildContext context) => 'Find your sitter';

  @override
  BuddySitterAction action(BuildContext context) =>
      Provider.of<ProviderSearchSitter>(context, listen: false).action(context);

  const Body({
    Key? key,
  }) : super(key: key);
}
