import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pizzaiolo_companion/src/features/home/home_view.dart';
import 'package:pizzaiolo_companion/src/features/logs/log_add_view.dart';
import 'package:pizzaiolo_companion/src/features/logs/logs_item_list_view.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_add_view.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_detail_view.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_list_view.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_controller.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_view.dart';

import 'services/repository.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.repository,
  });

  final SettingsController settingsController;
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case RecipeDetailView.routeName:
                    return const RecipeDetailView();
                  case RecipeAddView.routeName:
                    return RecipeAddView(repository: repository);
                  case LogAddView.routeName:
                    return LogAddView(repository: repository);
                  case LogsItemListView.routeName:
                    return LogsItemListView(
                        settingsController: settingsController,
                        repository: repository);
                  case RecipeListView.routeName:
                  default:
                    return HomeView(
                      settingsController: settingsController,
                      repository: repository,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
