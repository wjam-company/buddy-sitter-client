import 'package:buddy_sitter/presentation/utils/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SitterInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final FontWeight weight;
  const SitterInfoRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: BuddySitterColor.dark,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: weight),
        )
      ],
    );
  }
}
