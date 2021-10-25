import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/form_erros.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganismForm extends StatelessWidget {
  final List<Widget> fields;
  final FormProvider provider;
  final bool valid;
  final bool padding;

  const OrganismForm.column({
    Key? key,
    required this.fields,
    required this.provider,
    this.valid = true,
    this.padding = true,
  }) : super(key: key);
  const OrganismForm.slider({
    Key? key,
    required this.fields,
    required this.provider,
    this.valid = true,
    this.padding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<FormProvider>.value(
        value: provider,
        child: Form(
          child: Padding(
            padding: padding
                ? MediaHandler.dynamicType(
                    mobile: BuddySitterMeasurement.marginsHalf.copyWith(
                      bottom: 0.0,
                    ),
                    tablet: BuddySitterMeasurement.marginsHalf.copyWith(
                      bottom: 0.0,
                    ),
                    desktop: EdgeInsets.symmetric(
                      vertical: BuddySitterMeasurement.sizeHigh,
                      horizontal: BuddySitterMeasurement.sizeHigh * 5,
                    ).copyWith(
                      bottom: 0.0,
                    ),
                  )
                : BuddySitterMeasurement.marginsHalf.copyWith(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                  ),
            child: Column(children: children),
          ),
        ),
      );

  List<Widget> get children => valid
      ? List.generate(
          fields.length * 2,
          (index) {
            if (index % 2 == 0) {
              return fields[index ~/ 2];
            }
            return MoleculeFormErrors(
              entry: fields[index ~/ 2] is MoleculeInput
                  ? (fields[index ~/ 2] as MoleculeInput).entry
                  : null,
            );
          },
        )
      : List.generate(fields.length, (index) => fields[index]);
}
