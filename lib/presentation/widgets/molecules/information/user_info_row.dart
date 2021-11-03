import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoRow extends StatelessWidget {
  final String text;
  final IconData icon;

  const UserInfoRow({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: AtomText.content(
        text: text,
        padding: EdgeInsets.zero,
        textAlign: TextAlign.start,
      ),
    );
  }
}
