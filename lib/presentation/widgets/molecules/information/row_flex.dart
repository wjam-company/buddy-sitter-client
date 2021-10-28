import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/atoms/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuddySitterAction {
  final Icon icon;
  final String text;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  BuddySitterAction({
    required this.icon,
    this.onPressed,
    this.onLongPress,
    this.text = '',
  });
}

class MoleculeRowFLex extends StatelessWidget {
  final List<Widget>? children;
  final List<BuddySitterAction>? actions;
  final double? height;
  final bool ever;

  const MoleculeRowFLex.simple({
    Key? key,
    required this.children,
    this.actions,
    this.height,
    this.ever = false,
  }) : super(key: key);

  const MoleculeRowFLex.action({
    Key? key,
    this.children,
    required this.actions,
    required this.height,
    this.ever = false,
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
    Provider.of<MediaHandler>(context);
    List<Widget> childrenFLex =
        List.generate((currentList.length * 2) + 1, (index) {
      if (index % 2 == 0) {
        return (ever)
            ? const Spacer()
            : MediaHandler.requiredSingle(
                mobile: const Spacer(),
                tablet: const Spacer(),
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
