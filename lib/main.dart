import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_controller.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_service.dart';

import 'src/app.dart';
import 'src/services/repository.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());
  final repository = Repository(settingsController: settingsController);

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  await repository.auth();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController, repository: repository));
}
