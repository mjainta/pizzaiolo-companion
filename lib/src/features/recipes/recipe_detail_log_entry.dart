import 'package:flutter/material.dart';

class RecipeDetailLogEntry extends StatelessWidget {
  const RecipeDetailLogEntry({
    Key? key,
    required this.date,
    required this.icon,
  }) : super(key: key);

  final String date;
  final Icon icon;

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
          children: const [
            Icon(Icons.event),
            VerticalDivider(
              width: 8,
            ),
            Text('2022-10-09 '),
            Icon(
              Icons.thumb_up,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
