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
  final IconData? icon;
  final bool padding;
  final FocusNode? focus;
  final bool obscureText;
  final bool autofocus;
  final TextEditingController Function() controler;

  const MoleculeInput.text({
    Key? key,
    required this.text,
    this.icon,
    required this.entry,
    required this.controler,
    this.focus,
    this.autofocus = false,
    this.padding = true,
  })  : obscureText = false,
        super(key: key);

  const MoleculeInput.password({
    Key? key,
    required this.text,
    this.icon,
    required this.entry,
    required this.controler,
    this.focus,
    this.autofocus = false,
    this.padding = true,
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

  Widget decoratorPadding(Widget child) => widget.padding
      ? Padding(
          padding: EdgeInsets.zero.copyWith(
            bottom: BuddySitterMeasurement.sizeHalf,
          ),
          child: child,
        )
      : child;

  @override
  Widget build(BuildContext context) {
    ValidationItem? validation =
        Provider.of<FormProvider>(context).entries[widget.entry];

    List<Widget> children = [
      AtomText.content(
        text: widget.text,
        color: BuddySitterColor.dark,
      )
    ];

    if (widget.icon != null) {
      children.insert(
        0,
        Icon(
          widget.icon,
          color: isLog(validation)
              ? BuddySitterColor.actionsLog
              : BuddySitterColor.actionsSuccess,
        ),
      );
    }

    return decoratorPadding(
      TextFormField(
        autofocus: widget.autofocus,
        focusNode: widget.focus,
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
                children: children,
              ),
            ),
          ),
        ),
      ),
    ); // decoratorPadding
  }
}
