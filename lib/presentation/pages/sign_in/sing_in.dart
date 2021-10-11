import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
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
          title: AtomText.content(
            text: 'Sign In',
            color: BuddySitterColor.dark.brighten(.3),
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
        children: [
          AtomText.subheading(
            text: 'Welcome Back',
            color: BuddySitterColor.dark,
          ),
          AtomText.content(
            text: 'Sign in with your email and your password',
            padding: EdgeInsets.zero,
            color: BuddySitterColor.dark,
          ),
          const OrganismForm.column(
            fields: [
              MoleculeInput.text(
                text: 'Enter your email',
                icon: Icons.email_outlined,
              ),
              MoleculeInput.password(
                text: 'Enter your password',
                icon: Icons.password_outlined,
              ),
            ],
          ),
          const Spacer(),
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

class MoleculeInput extends StatelessWidget {
  final String text;
  //  = 'Enter your email';
  final IconData icon;
  final bool obscureText;
  //  = Icons.email_outlined;
  const MoleculeInput.text({
    Key? key,
    required this.text,
    required this.icon,
  })  : obscureText = false,
        super(key: key);

  const MoleculeInput.password({
    Key? key,
    required this.text,
    required this.icon,
  })  : obscureText = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Padding(
          padding: EdgeInsets.zero.copyWith(
            left: BuddySitterMeasurement.sizeLeast,
          ),
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: BuddySitterColor.actionsLog,
                ),
                AtomText.content(text: text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrganismForm extends StatelessWidget {
  final List<Widget> fields;

  const OrganismForm.column({Key? key, required this.fields}) : super(key: key);
  const OrganismForm.slider({Key? key, required this.fields}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = List.generate(
      fields.length * 2,
      (index) => index % 2 == 0
          ? fields[index ~/ 2]
          : SizedBox(
              height: BuddySitterMeasurement.sizeHalf,
            ),
    );
    return Form(
      child: Padding(
        padding: BuddySitterMeasurement.marginsHalf.copyWith(bottom: 0.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
