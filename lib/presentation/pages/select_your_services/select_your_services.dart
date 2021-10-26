import 'package:buddy_sitter/presentation/pages/interfaces/search_filter.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider.dart';

class SelectYourService extends SearchFilter<ProviderSelectYourService> {
  const SelectYourService({Key? key}) : super(key: key);

  @override
  ProviderSelectYourService providerWithAppBar(
          BuildContext context, FormProvider formProvider) =>
      ProviderSelectYourService(formProvider);

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

class Body extends BodySearchFilter {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Future<List<ItemListItem>> listData(BuildContext context) async {
    ProviderSelectYourService providerSelectYourPet =
        Provider.of<ProviderSelectYourService>(context);
    return await providerSelectYourPet.data;
  }

  @override
  String listTitle(BuildContext context) => 'Chouse your service';

  @override
  BuddySitterAction action(BuildContext context) =>
      Provider.of<ProviderSelectYourService>(context, listen: false)
          .action(context);
}
