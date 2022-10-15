import 'package:flutter/material.dart';

class RecipeDetailCard extends StatelessWidget {
  const RecipeDetailCard({
    Key? key,
    required this.iconImage,
    required this.name,
    required this.amount,
    required this.amountUnit,
  }) : super(key: key);

  final Image iconImage;
  final String name;
  final int amount;
  final String amountUnit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            iconImage,
            const VerticalDivider(
              width: 8,
            ),
            Column(
              // Align text to the left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text('$amount $amountUnit'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
