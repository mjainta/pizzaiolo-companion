import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/classes/log.dart';
import 'package:pizzaiolo_companion/src/features/logs/log_add_view.dart';
import 'package:pizzaiolo_companion/src/features/logs/log_tile.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';

import '../settings/settings_controller.dart';

class LogsItemListView extends StatefulWidget {
  const LogsItemListView({
    super.key,
    required this.settingsController,
    required this.repository,
  });

  final SettingsController settingsController;
  final Repository repository;

  static const routeName = '/log/list';

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
                return LogTile(log: log);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.restorablePushNamed(context, LogAddView.routeName);
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
