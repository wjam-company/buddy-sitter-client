import 'package:buddy_sitter/presentation/pages/home/user_info_row.dart';
import 'package:flutter/cupertino.dart';

class UserInfo extends StatelessWidget {
  final Map user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  String _selectRole() {
    const description = "Role: ";
    if (user['role'] == "ROLE_OWNER") {
      return description + "Owner";
    } else {
      return description + "Sitter";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("I am an animal-loving pet owner, outdoorsy"),
        ),
        UserInfoRow(text: _selectRole(), icon: CupertinoIcons.profile_circled),
        const UserInfoRow(
            text: "Active", icon: CupertinoIcons.check_mark_circled_solid)
      ],
    );
  }
}
