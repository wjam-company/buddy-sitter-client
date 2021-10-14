import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoleculeInput extends StatelessWidget {
  final String text;
  final String entry;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controler;

  const MoleculeInput.text({
    Key? key,
    required this.text,
    required this.icon,
    required this.entry,
    this.controler,
  })  : obscureText = false,
        super(key: key);

  const MoleculeInput.password({
    Key? key,
    required this.text,
    required this.icon,
    required this.entry,
    this.controler,
  })  : obscureText = true,
        super(key: key);

  bool isLog(ValidationItem? validation) =>
      (validation == null || validation.value == null);

  @override
  Widget build(BuildContext context) {
    ValidationItem? validation =
        Provider.of<FormProvider>(context).entries[entry];
    return TextFormField(
      controller: controler,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedBorder: isLog(validation)
            ? null
            : OutlineInputBorder(
                borderRadius: BuddySitterMeasurement.borderRadiusHalf,
                borderSide: BorderSide(
                  color: BuddySitterColor.actionsSuccess,
                ),
                gapPadding: BuddySitterMeasurement.sizeLeast,
              ),
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
                  color: isLog(validation)
                      ? BuddySitterColor.actionsLog
                      : BuddySitterColor.actionsSuccess,
                ),
                AtomText.content(
                  text: text,
                  color: BuddySitterColor.dark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
