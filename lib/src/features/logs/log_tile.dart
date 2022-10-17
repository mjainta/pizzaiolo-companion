import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/classes/log.dart';

class LogTile extends StatelessWidget {
  const LogTile({
    Key? key,
    required this.log,
  }) : super(key: key);

  final Log log;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Image.asset(
          'assets/images/icons/calendar.png',
          fit: BoxFit.cover,
        ),
      ),
      title:
          Text('${log.created.year}-${log.created.month}-${log.created.day}'),
      subtitle: Text(
          'Taste: ${log.ratingTaste}\nProcessability: ${log.ratingProcessability}, Fluffyness: ${log.ratingFluffyness}'),
      // trailing: Text(
      //     'Total rating: ${((log.ratingTaste + log.ratingProcessability + log.ratingFluffyness) / 3).toStringAsFixed(1)}'),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: Column(
          children: [
            const Icon(Icons.sports_score),
            Text(((log.ratingTaste +
                        log.ratingProcessability +
                        log.ratingFluffyness) /
                    3)
                .toStringAsFixed(1)),
          ],
        ),
      ),
      isThreeLine: true,
      onTap: () {
        print('"Move to Log Detail View" Placeholder Message');
      },
    );
  }
}
