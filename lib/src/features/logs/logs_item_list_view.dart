import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/classes/log.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_add_view.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';
import 'package:pocketbase/pocketbase.dart';

import '../settings/settings_controller.dart';
import '../settings/settings_view.dart';

class LogsItemListView extends StatefulWidget {
  const LogsItemListView({
    super.key,
    this.items = const [],
    required this.settingsController,
    required this.repository,
  });

  final SettingsController settingsController;
  final Repository repository;

  static const routeName = '/log/list';

  final List<RecordModel> items;

  @override
  _State createState() => _State();
}

class _State extends State<LogsItemListView> {
  @override
  Widget build(BuildContext context) {
    List<Log>? logs = [];
    return FutureBuilder(
      future: widget.repository.getLogs(),
      builder: (context, AsyncSnapshot<List<Log>> snapshot) {
        if (snapshot.hasData) {
          logs = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recipes'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () async {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),

            // To work with lists that may contain a large number of items, it’s best
            // to use the ListView.builder constructor.
            //
            // In contrast to the default ListView constructor, which requires
            // building all Widgets up front, the ListView.builder constructor lazily
            // builds Widgets as they’re scrolled into view.
            body: ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'logListView',
              itemCount: logs!.length,
              itemBuilder: (BuildContext context, int index) {
                final Log log = logs![index];

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
                  title: Text(
                      '${log.created.year}-${log.created.month}-${log.created.day}'),
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
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, RecipeAddView.routeName);
              },
              child: const Icon(Icons.add),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
