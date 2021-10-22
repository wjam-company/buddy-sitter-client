import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:flutter/material.dart';

class ActionsRowFLex {
  final Icon icon;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  ActionsRowFLex({required this.icon, this.onPressed, this.onLongPress});
}

class MoleculeRowFLex extends StatelessWidget {
  final List<Widget>? children;
  final List<ActionsRowFLex>? actions;
  final double? height;
  const MoleculeRowFLex.simple({
    Key? key,
    required this.children,
    this.actions,
    this.height,
  }) : super(key: key);

  const MoleculeRowFLex.action({
    Key? key,
    this.children,
    required this.actions,
    required this.height,
  }) : super(key: key);

  List<dynamic> get currentList =>
      actions == null ? (children ?? []) : (actions ?? []);

  Widget decoratorAction(dynamic child) => child is Widget
      ? child
      : AtomButton.cicle(
          onPressed: child.onPressed,
          onLongPress: child.onLongPress,
          height: height,
          icon: child.icon,
        );

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenFLex =
        List.generate((currentList.length * 2) - 1, (index) {
      if (index % 2 == 1) {
        return MediaHandler.requiredSingle(
          mobile: const Spacer(),
          tablet: SizedBox(width: BuddySitterMeasurement.sizeHalf),
          desktop: SizedBox(width: BuddySitterMeasurement.sizeHalf),
        );
      } else {
        return decoratorAction(currentList[index ~/ 2]);
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: childrenFLex,
    );
  }
}
