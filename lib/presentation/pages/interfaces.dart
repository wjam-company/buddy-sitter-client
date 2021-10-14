import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BuddySitterPageProvider<T extends ChangeNotifier>
    extends StatelessWidget {
  BuddySitterPageProvider({Key? key}) : super(key: key);

  T provider(BuildContext context) {
    throw UnimplementedError();
  }

  Widget get appBarTitle {
    throw UnimplementedError();
  }

  Widget get body {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    MediaHandler.of(context);
    return ChangeNotifierProvider<T>(
      create: (_) => provider(_),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              Provider.of<RouterPageHandler>(context).canPop,
          title: appBarTitle,
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}
