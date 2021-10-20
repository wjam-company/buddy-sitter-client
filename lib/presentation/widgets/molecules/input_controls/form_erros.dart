import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/form/validation_item.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/feedback/error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoleculeFormErrors extends StatelessWidget {
  final String? entry;
  const MoleculeFormErrors({
    Key? key,
    this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      entry != null ? Column(children: errors(context)) : const SizedBox();

  List<Widget> errors(BuildContext context) =>
      (Provider.of<FormProvider>(context).errors[entry] as ValidationItem)
          .errors
          .map<Widget>((error) => AtomError(error: error))
          .toList();
}
