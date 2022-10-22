import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/features/logs/logs_item_list_view.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_list_view.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_controller.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_view.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';

/// Displays detailed information about a SampleItem.
class HomeView extends StatefulWidget {
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
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final List<String> titleList = ["Pizza logs", "Pizza recipes"];
  String currentTitle = '';

  @override
  void initState() {
    currentTitle = titleList[0];
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(changeTitle); // Registering listener
    super.initState();
  }

  // This function is called, every time active tab is changed
  void changeTitle() {
    setState(() {
      // get index of active tab & change current appbar title
      currentTitle = titleList[tabController!.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
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
          controller: tabController,
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
        controller: tabController,
        children: [
          LogsItemListView(
            repository: widget.repository,
            settingsController: widget.settingsController,
          ),
          RecipeListView(
            settingsController: widget.settingsController,
            repository: widget.repository,
          ),
        ],
      ),
    );
  }
}
