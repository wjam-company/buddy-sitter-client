import 'package:buddy_sitter/presentation/utils/media/media.dart';
import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:buddy_sitter/presentation/utils/theme/measurement.dart';
import 'package:buddy_sitter/presentation/widgets/molecules/information/row_flex.dart';
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
        shape: MediaHandler.dynamicType(
          mobile: RoundedRectangleBorder(
            borderRadius: BuddySitterMeasurement.borderRadiusHalf.copyWith(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          desktop: RoundedRectangleBorder(
              borderRadius: BuddySitterMeasurement.borderRadiusHalf),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: color,
          child: Padding(
            padding: EdgeInsets.zero.copyWith(
              bottom: MediaHandler.dynamicType(
                mobile: BuddySitterMeasurement.sizeHigh * index,
              ),
            ),
            child: child,
          ),
        ),
      );

  Widget generateSize({
    required Widget child,
    required int index,
  }) =>
      MediaHandler.requiredSingle(
        mobile: SizedBox(
          height: BuddySitterMeasurement.sizeHigh * (index + 1),
          width: double.infinity,
          child: child,
        ),
        desktop: SizedBox(
          height: BuddySitterMeasurement.sizeHigh,
          child: child,
        ),
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

    List<Widget> content = MediaHandler.runWhen<List<Widget>>(
      mobile: () => [
        Expanded(child: child),
        Stack(
          alignment: Alignment.bottomCenter,
          children: children,
        ),
      ],
      tablet: () => [
        Expanded(child: child),
        Stack(
          alignment: Alignment.bottomCenter,
          children: children,
        ),
      ],
      desktop: () => [
        Expanded(child: child),
        MoleculeRowFLex.simple(
          children: [
            Row(
              children: List.generate(
                (children.length * 2) - 1,
                (index) {
                  if (index % 2 == 0) {
                    return children[index ~/ 2];
                  }
                  return SizedBox(width: BuddySitterMeasurement.sizeHalf);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: BuddySitterMeasurement.sizeHigh,
        ),
      ],
    ) as List<Widget>;

    return SafeArea(
      child: MediaHandler.requiredSingle(
        mobile: SizedBox(
          child: Column(
            children: content,
          ),
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.2,
            ),
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.6,
              child: Column(
                children: content,
              ),
            ),
            SizedBox(
              width: BuddySitterMeasurement.sizeUpper * 0.2,
            ),
          ],
        ),
      ), // MediaHandler.requiredSingle
    );
  }
}
