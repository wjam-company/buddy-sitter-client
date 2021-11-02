import 'package:buddy_sitter/presentation/widgets/molecules/information/sitter_info_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SitterInfo extends StatelessWidget {
  final String address;
  final String petAccepted;

  const SitterInfo({Key? key, required this.address, required this.petAccepted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SitterInfoRow(
          icon: Icons.email,
          text: "Personal Information",
          weight: FontWeight.bold,
        ),
        SitterInfoRow(
          icon: Icons.add_location,
          text: address,
          weight: FontWeight.normal,
        ),
        Row(
          children: const [
            SitterInfoRow(
              icon: Icons.adb,
              text: "Pet Accepted:",
              weight: FontWeight.normal,
            ),
          ],
        ),
        Row(
          children: [Text("\t         " + petAccepted)],
        )
      ],
    );
  }
}
