import 'dart:js';

import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider.dart';

class SelectYourPet extends SearchFilter<ProviderSelectYourPet> {
  const SelectYourPet({Key? key}) : super(key: key);

  @override
  ProviderSelectYourPet providerWithAppBar(
          BuildContext context, FormProvider formProvider) =>
      ProviderSelectYourPet(formProvider);

  @override
  BuddySitterAction appBarAction(context, currentProvider) => BuddySitterAction(
        icon: Icon(
          Icons.search,
          color: BuddySitterColor.dark.brighten(.5),
        ),
        text: 'Search',
        onPressed: currentProvider.filter,
      );

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const Body();
}

class Body extends BodySearchFilter {
  @override
  Future<List<ItemListItem>> listData(BuildContext context) async {
    ProviderSelectYourPet providerSelectYourPet =
        Provider.of<ProviderSelectYourPet>(context);
    return await providerSelectYourPet.data;
  }

  @override
  String listTitle(BuildContext context) => 'Chouse your pet';

  @override
  BuddySitterAction action(BuildContext context) =>
      Provider.of<ProviderSelectYourPet>(context, listen: false).action;

  const Body({
    Key? key,
  }) : super(key: key);
}
