import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BuddySitterPageProvider<T extends ChangeNotifier>
    extends StatelessWidget {
  const BuddySitterPageProvider({Key? key}) : super(key: key);

  T provider(BuildContext context) {
    throw UnimplementedError();
  }

  T providerWithAppBar(BuildContext context, FormProvider formProvider) {
    throw UnimplementedError();
  }

  FormProvider get appBarProvider {
    throw UnimplementedError();
  }

  Widget appBarTitle(BuildContext context) {
    throw UnimplementedError();
  }

  Widget appBarTitleProvider(BuildContext context, FormProvider validators) {
    throw UnimplementedError();
  }

  Widget body(BuildContext context) {
    throw UnimplementedError();
  }

  bool get haveAppBar => true;

  bool get haveAppBarProvider => false;

  @override
  Widget build(BuildContext context) {
    late FormProvider barProvider;
    if (haveAppBarProvider) {
      barProvider = appBarProvider;
    }
    MediaHandler.of(context);
    return ChangeNotifierProvider<T>(
      create: (_) {
        final T currentProvider;
        if (haveAppBarProvider) {
          currentProvider = providerWithAppBar(context, barProvider);
        } else {
          currentProvider = provider(_);
        }
        return currentProvider;
      },
      child: Scaffold(
        appBar: haveAppBar
            ? AppBar(
                automaticallyImplyLeading:
                    Provider.of<RouterPageHandler>(context, listen: false)
                        .canPop,
                title: haveAppBarProvider
                    ? appBarTitleProvider(context, barProvider)
                    : appBarTitle(context),
                centerTitle: true,
              )
            : null,
        body: body(context),
      ),
    );
  }
}
