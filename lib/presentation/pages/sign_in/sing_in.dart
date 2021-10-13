import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/sign_in_validate.dart';
import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
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
            color: BuddySitterColor.dark.brighten(0.3),
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
    final FormProvider validators = FormProvider([
      SignInValidator.mail,
      SignInValidator.password,
    ]);
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
          OrganismForm.column(
            provider: validators,
            fields: [
              MoleculeInput.text(
                controler: validators.valid(
                  SignInValidator.mail,
                  validator: SignInValidator.validEmail,
                ),
                text: 'Enter your email',
                icon: Icons.email_outlined,
              ),
              MoleculeInput.password(
                controler: validators.valid(
                  SignInValidator.password,
                  validator: SignInValidator.validPassword,
                ),
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
            colorHadler: (_) => BuddySitterColor.actionsLog,
          ),
        ),
      ],
    );
  }
}

class MoleculeInput extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controler;

  const MoleculeInput.text({
    Key? key,
    required this.text,
    required this.icon,
    this.controler,
  })  : obscureText = false,
        super(key: key);

  const MoleculeInput.password({
    Key? key,
    required this.text,
    required this.icon,
    this.controler,
  })  : obscureText = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
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
  final FormProvider provider;

  const OrganismForm.column({
    Key? key,
    required this.fields,
    required this.provider,
  }) : super(key: key);
  const OrganismForm.slider({
    Key? key,
    required this.fields,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormProvider>.value(
        value: provider,
        child: Form(
          child: Padding(
              padding: BuddySitterMeasurement.marginsHalf.copyWith(bottom: 0.0),
              child: Column(
                children: [
                  Column(children: children),
                  const MoleculeFormErrors(),
                ],
              )),
        ));
  }

  List<Widget> get children => List.generate(
        fields.length * 2,
        (index) => index % 2 == 0
            ? fields[index ~/ 2]
            : SizedBox(
                height: BuddySitterMeasurement.sizeHalf,
              ),
      );
}

class MoleculeFormErrors extends StatelessWidget {
  const MoleculeFormErrors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> errors = Provider.of<FormProvider>(context)
        .errors
        .map<String, Widget>((key, value) {
          List<Widget> valueWidgets = value.errors
              .map<Widget>(
                (error) => Row(
                  children: [
                    Padding(
                      child: FormError.iconOf(error.type),
                      padding: BuddySitterMeasurement.marginsLeast
                          .copyWith(left: BuddySitterMeasurement.sizeHalf),
                    ),
                    AtomText.caption(
                      text: error.message,
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              )
              .toList();
          if (valueWidgets.isNotEmpty) {
            valueWidgets.insert(
                0,
                AtomText.content(
                  text: key,
                  padding: EdgeInsets.zero,
                ));
          }
          return MapEntry(
            key,
            Column(
              children: valueWidgets,
            ),
          );
        })
        .values
        .toList();

    return Column(children: errors);
  }
}
