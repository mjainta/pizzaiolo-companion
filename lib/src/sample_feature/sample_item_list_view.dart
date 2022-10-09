import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import '../settings/settings_view.dart';
import '../settings/settings_controller.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';
import '../services/repository.dart';
import '../classes/recipe.dart';

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({
    super.key,
    this.items = const [],
    required this.settingsController,
    required this.repository,
  });

  final SettingsController settingsController;
  final Repository repository;

  static const routeName = '/';

  final List<RecordModel> items;

  @override
  _State createState() => _State();
}

class _State extends State<SampleItemListView> {
  @override
  Widget build(BuildContext context) {
    List<Recipe>? myItems = [];
    return FutureBuilder(
        future: widget.repository.getRecipes(),
        builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.hasData) {
            myItems = snapshot.data;
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
                restorationId: 'sampleItemListView',
                itemCount: myItems!.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = myItems![index];

                  return ListTile(
                      title: Text(recipe.name),
                      leading: const CircleAvatar(
                        // Display the Flutter Logo image asset.
                        foregroundImage:
                            AssetImage('assets/images/flutter_logo.png'),
                      ),
                      trailing: Text('For ${recipe.ballNo} dough balls'),
                      onTap: () {
                        // Navigate to the details page. If the user leaves and returns to
                        // the app after it has been killed while running in the
                        // background, the navigation stack is restored.
                        Navigator.restorablePushNamed(
                          context,
                          SampleItemDetailsView.routeName,
                        );
                      });
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
