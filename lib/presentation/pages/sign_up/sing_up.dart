import 'package:buddy_sitter/data/static/texts/sign_in.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/sign_in_validate.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import '../interfaces/interfaces.dart';
import './provider.dart';

class SignUp extends BuddySitterPageProvider<ProviderSignUp> {
  const SignUp({Key? key}) : super(key: key);

  @override
  ProviderSignUp provider(BuildContext context) => ProviderSignUp();

  @override
  // ignore: avoid_renaming_method_parameters
  Widget appBarTitle(_) => AtomText.content(
        text: 'Sign Up',
        color: BuddySitterColor.dark.brighten(0.3),
      );

  @override
  // ignore: avoid_renaming_method_parameters
  Widget body(_) => const Body();
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormProvider validators = FormProvider([
      SignValidator.mail,
      SignValidator.userName,
      SignValidator.password,
    ]);
    return TemplateActionBottom(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          AtomText.subheading(
            text: DataTextSignIn.title,
            color: BuddySitterColor.dark,
            padding: EdgeInsets.zero,
          ),
          AtomText.content(
            text: DataTextSignIn.description,
            padding: EdgeInsets.zero,
            color: BuddySitterColor.dark,
          ),
          OrganismForm.column(
            provider: validators,
            fields: [
              MoleculeInput.text(
                entry: SignValidator.userName,
                controler: validators.valid(
                  SignValidator.userName,
                  validator: SignValidator.validUserName,
                ),
                text: 'Enter a user name',
                icon: Icons.email_outlined,
              ),
              MoleculeInput.text(
                entry: SignValidator.mail,
                controler: validators.valid(
                  SignValidator.mail,
                  validator: SignValidator.validEmail,
                ),
                text: 'Enter a email',
                icon: Icons.email_outlined,
              ),
              MoleculeInput.password(
                entry: SignValidator.password,
                controler: validators.valid(
                  SignValidator.password,
                  validator: SignValidator.validPassword,
                ),
                text: 'Enter a password',
                icon: Icons.password_outlined,
              ),
            ],
          ),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            icon: Icon(
              Icons.check,
              color: BuddySitterColor.actionsSuccess,
            ),
            height: BuddySitterMeasurement.sizeHalf / 2,
            text: AtomText.content(
              text: DataTextSignIn.button,
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: () {
              validators.entries.forEach((key, value) {});
            },
          ),
        ),
      ],
    );
  }
}
