import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/features/logs/logs_item_list_view.dart';
import 'package:pizzaiolo_companion/src/features/recipes/sample_item_list_view.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_controller.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_view.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';

/// Displays detailed information about a SampleItem.
class HomeView extends StatelessWidget {
  // const HomeView({super.key});
  const HomeView({
    super.key,
    required this.settingsController,
    required this.repository,
  });

  final SettingsController settingsController;
  final Repository repository;

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () async {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Image.asset(
                  'assets/images/icons/calendar.png',
                  width: 30,
                ),
              ),
              Tab(
                child: Image.asset(
                  'assets/images/icons/recipe.png',
                  width: 30,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LogsItemListView(
              repository: repository,
              settingsController: settingsController,
            ),
            SampleItemListView(
              settingsController: settingsController,
              repository: repository,
            ),
          ],
        ),
      ),
    );
  }
}
