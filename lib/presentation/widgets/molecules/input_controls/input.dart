import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';

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
