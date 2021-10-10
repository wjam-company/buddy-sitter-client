import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:flutter/material.dart';

class ItemActionBottom {
  final Widget child;
  BuddySitterColor color;
  ItemActionBottom({required this.child, required this.color});
}

class TemplateActionBottom extends StatelessWidget {
  final Widget child;
  final List<ItemActionBottom> childrenBottom;

  const TemplateActionBottom({
    Key? key,
    required this.child,
    required this.childrenBottom,
  }) : super(key: key);

  Widget generateCard({
    required Widget child,
    required int index,
    required final BuddySitterColor color,
  }) =>
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BuddySitterMeasurement.borderRadiusHalf.copyWith(
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: color,
          child: Padding(
            padding: EdgeInsets.zero.copyWith(
              bottom: BuddySitterMeasurement.sizeHigh * index,
            ),
            child: child,
          ),
        ),
      );

  Widget generateSize({
    required Widget child,
    required int index,
  }) =>
      SizedBox(
        height: BuddySitterMeasurement.sizeHigh * (index + 1),
        width: double.infinity,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    List<Widget> children = childrenBottom
        .asMap()
        .map(
          (key, value) {
            Widget item = generateSize(
              index: key,
              child: generateCard(
                index: key,
                child: value.child,
                color: value.color,
              ),
            );
            return MapEntry(key, item);
          },
        )
        .values
        .toList()
        .reversed
        .toList();

    return SafeArea(
      child: Column(
        children: [
          Expanded(child: child),
          Stack(
            alignment: Alignment.bottomCenter,
            children: children,
          ),
        ],
      ),
    );
  }
}
