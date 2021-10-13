import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/error.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/texts/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoleculeFormErrors extends StatelessWidget {
  const MoleculeFormErrors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: errors(context));
  }

  List<Widget> errors(BuildContext context) =>
      Provider.of<FormProvider>(context)
          .errors
          .map<String, Widget>(constructorOfWidgets)
          .values
          .toList();

  MapEntry<String, Widget> constructorOfWidgets(key, value) =>
      MapEntry(key, Column(children: constructorListOfErrors(value, key)));

  List<Widget> constructorListOfErrors(value, key) {
    List<Widget> valueWidgets = value.errors
        .map<Widget>(
          (error) => AtomError(error: error),
        )
        .toList();
    if (valueWidgets.isNotEmpty) {
      valueWidgets.insert(
        0,
        AtomText.content(text: key, padding: EdgeInsets.zero),
      );
    }
    return valueWidgets;
  }
}
