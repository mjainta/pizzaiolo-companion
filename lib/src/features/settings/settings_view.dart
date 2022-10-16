import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/components/icon_attribution.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            const Divider(height: 8, thickness: 0),
            Expanded(child: Container()),
            const IconAttribution(
              authorName: 'surang',
              authorUrl: 'https://www.flaticon.com/authors/surang',
              iconPaths: [
                'assets/images/icons/salt.png',
                'assets/images/icons/yeast.png',
              ],
            ),
            const Divider(
              height: 4,
              thickness: 0,
            ),
            const IconAttribution(
              authorName: 'Freepik',
              authorUrl: 'https://www.flaticon.com/authors/freepik',
              iconPaths: [
                'assets/images/icons/flour.png',
                'assets/images/icons/water-drop.png',
                'assets/images/icons/honey.png',
                'assets/images/icons/olive-oil.png',
                'assets/images/icons/pencil.png',
                'assets/images/icons/taste.png',
                'assets/images/icons/roller.png',
              ],
            ),
            const Divider(
              height: 4,
              thickness: 0,
            ),
            const IconAttribution(
              authorName: 'amonrat rungreangfangsai',
              authorUrl:
                  'https://www.flaticon.com/authors/amonrat-rungreangfangsai',
              iconPaths: [
                'assets/images/icons/ferment.png',
              ],
            ),
            const Divider(
              height: 4,
              thickness: 0,
            ),
            const IconAttribution(
              authorName: 'Flat Icons',
              authorUrl: 'https://www.flaticon.com/authors/flat-icons',
              iconPaths: [
                'assets/images/icons/calendar.png',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
