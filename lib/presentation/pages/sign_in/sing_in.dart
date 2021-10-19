import 'package:buddy_sitter/data/static/texts/sign_in.dart';
import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/sign_in_validate.dart';
import 'package:buddy_sitter/presentation/utils/navigator/locations.dart';
import 'package:buddy_sitter/presentation/utils/navigator/page_handler.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/form.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../interfaces.dart';
import './provider.dart';

class SignIn extends BuddySitterPageProvider<ProviderSignIn> {
  const SignIn({Key? key}) : super(key: key);

  @override
  ProviderSignIn provider(BuildContext context) => ProviderSignIn();

  @override
  Widget appBarTitle(_) => AtomText.content(
        text: DataTextSignIn.appBarTitle,
        color: BuddySitterColor.dark.brighten(0.3),
      );

  @override
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
      SignValidator.password,
    ]);
    return TemplateActionBottom(
      child: ListView(
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
                entry: SignValidator.mail,
                controler: validators.valid(
                  SignValidator.mail,
                  validator: SignValidator.validEmail,
                ),
                text: DataTextSignIn.labelEmail,
                icon: Icons.email_outlined,
              ),
              MoleculeInput.password(
                entry: SignValidator.password,
                controler: validators.valid(
                  SignValidator.password,
                  validator: SignValidator.validPassword,
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
                onPressed: () =>
                    Provider.of<RouterPageHandler>(context, listen: false).show(
                  BuddySitterLocation.recoverPassword,
                  preLoad: BuddySitterLocation.recoverPassword,
                ),
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
              if (validators.isValid) {
                final RouterPageHandler pageHandler =
                    Provider.of<RouterPageHandler>(context, listen: false);
                pageHandler.state = true;
                pageHandler.show(BuddySitterLocation.explore);
              }
            },
          ),
        ),
      ],
    );
  }
}
