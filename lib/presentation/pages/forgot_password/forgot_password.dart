import 'package:buddy_sitter/data/static/texts/sign_in.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/sign_in_validate.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import '../interfaces.dart';
import './provider.dart';

class ForgotPassword extends BuddySitterPageProvider<ProviderOnboarding> {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  ProviderOnboarding provider(BuildContext context) => ProviderOnboarding();

  @override
  Widget get appBarTitle => AtomText.content(
        text: DataTextSignIn.appBarTitle,
        color: BuddySitterColor.dark.brighten(0.3),
      );

  @override
  Widget get body => const BodyOnboarding();
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
            text: DataTextSignIn.title,
            color: BuddySitterColor.dark,
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
                entry: SignInValidator.mail,
                controler: validators.valid(
                  SignInValidator.mail,
                  validator: SignInValidator.validEmail,
                ),
                text: DataTextSignIn.labelEmail,
                icon: Icons.email_outlined,
              ),
              MoleculeInput.password(
                entry: SignInValidator.password,
                controler: validators.valid(
                  SignInValidator.password,
                  validator: SignInValidator.validPassword,
                ),
                text: DataTextSignIn.labelPassword,
                icon: Icons.password_outlined,
              ),
              AtomButton.text(
                text: AtomText.caption(
                  text: 'Forgot password',
                  color: BuddySitterColor.dark,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  validators.entries.forEach((key, value) {
                    print(key);
                    print(value.value);
                    print(value.errors);
                  });
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.actionsLog,
          child: AtomButton.bottom(
            text: AtomText.content(
              text: DataTextSignIn.button,
              color: BuddySitterColor.light.brighten(0.5),
            ),
            colorHadler: (_) => BuddySitterColor.actionsLog,
            onPressed: () {
              validators.entries.forEach((key, value) {
                print(key);
                print(value.value);
                print(value.errors);
              });
            },
          ),
        ),
      ],
    );
  }
}
