import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoleculeInput extends StatefulWidget {
  final String text;
  final String entry;
  final IconData icon;
  final bool obscureText;
  final TextEditingController Function() controler;

  const MoleculeInput.text({
    Key? key,
    required this.text,
    required this.icon,
    required this.entry,
    required this.controler,
  })  : obscureText = false,
        super(key: key);

  const MoleculeInput.password({
    Key? key,
    required this.text,
    required this.icon,
    required this.entry,
    required this.controler,
  })  : obscureText = true,
        super(key: key);

  @override
  State<MoleculeInput> createState() => _MoleculeInputState();
}

class _MoleculeInputState extends State<MoleculeInput> {
  late TextEditingController _controler;

  bool isLog(ValidationItem? validation) =>
      (validation == null || validation.value == null);

  @override
  void initState() {
    _controler = widget.controler();
    super.initState();
  }

  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValidationItem? validation =
        Provider.of<FormProvider>(context).entries[widget.entry];
    return TextFormField(
      controller: _controler,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BuddySitterMeasurement.borderRadiusHalf,
          borderSide: BorderSide(
            color: isLog(validation)
                ? BuddySitterColor.actionsLog
                : BuddySitterColor.actionsSuccess,
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
                Builder(
                  builder: (BuildContext context) => Icon(
                    widget.icon,
                    color: isLog(validation)
                        ? BuddySitterColor.actionsLog
                        : BuddySitterColor.actionsSuccess,
                  ),
                ),
                AtomText.content(
                  text: widget.text,
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
