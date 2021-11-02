import 'package:buddy_sitter/presentation/pages/home/user_info.dart';
import 'package:buddy_sitter/presentation/utils/localstorage/stateless.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/bar_menu.dart';
import 'package:buddy_sitter/presentation/widgets/organisms/card.dart';
import 'package:buddy_sitter/presentation/widgets/template/action_bottom.dart';
import 'package:buddy_sitter/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeBody> {
  Map? _user;

  _HomeState() {
    Map map = BuddySitterData().state.syncGet();
    _user = map["user"];
  }

  @override
  Widget build(BuildContext context) {
    return TemplateActionBottom(
      child: ListView(
        children: [
          // Pop-us
          OrganismCard.list(
            actionLeft: BuddySitterAction(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.add,
                color: BuddySitterColor.actionsLog,
              ),
            ),
            actionRight: BuddySitterAction(
              onPressed: () {
                AuthService.logout(context);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: BuddySitterColor.complementaryRed,
              ),
            ),
            content: "Email: ${_user!["email"]}",
            image:
                'https://cms.finnair.com/resource/blob/1393186/668fd19a69a530c7895e91940fe7803a/finnair-lapland-dog-woman-face-closeup-data.jpg?impolicy=crop&width=992&height=558&x=0&y=807&imwidth=768',
            name: _user?["username"],
            profile:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjh5E6lDdlw5R7h6tiwcvuly5qfbRnrVV6tKrGc-bb1Zq-Mu1kbcwPgFIN0w_jKsAFbNo&usqp=CAU',
            children: [
              UserInfo(
                user: _user!,
              )
            ],
          ),
        ],
      ),
      childrenBottom: [
        ItemActionBottom(
          color: BuddySitterColor.primaryPurple.brighten(.9),
          child: const OrganismBarMenu(),
        ),
      ],
    );
  }
}
