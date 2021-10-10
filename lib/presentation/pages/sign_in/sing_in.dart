import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces.dart';
import './provider.dart';

class SignIn extends BuddySitterPageProvider {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaHandler.of(context);
    return ChangeNotifierProvider<ProviderOnboarding>(
      create: (_) => ProviderOnboarding(),
      child: Scaffold(
        appBar: AppBar(
          title: AtomText.headingLeast(
            text: 'Sign In',
            color: BuddySitterColor.dark,
          ),
          centerTitle: true,
        ),
        body: const BodyOnboarding(),
      ),
    );
  }
}

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Spacer(),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton(
            text: 'Sign In',
            colorHadler: (_) {
              return BuddySitterColor.actionsLog;
            },
          ),
        ),
      ],
    );
  }
}
