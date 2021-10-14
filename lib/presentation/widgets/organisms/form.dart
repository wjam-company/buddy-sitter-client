import 'package:buddy_sitter/presentation/utils/form/provider.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/input_controls/form_erros.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganismForm extends StatelessWidget {
  final List<Widget> fields;
  final FormProvider provider;

  const OrganismForm.column({
    Key? key,
    required this.fields,
    required this.provider,
  }) : super(key: key);
  const OrganismForm.slider({
    Key? key,
    required this.fields,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<FormProvider>.value(
          value: provider,
          child: Form(
            child: Padding(
                padding:
                    BuddySitterMeasurement.marginsHalf.copyWith(bottom: 0.0),
                child: Column(
                  children: [
                    Column(children: children),
                    const MoleculeFormErrors(),
                  ],
                )),
          ));

  List<Widget> get children => List.generate(
        fields.length * 2,
        (index) => index % 2 == 0
            ? fields[index ~/ 2]
            : SizedBox(
                height: BuddySitterMeasurement.sizeHalf,
              ),
      );
}
