import 'package:pizzaiolo_companion/src/classes/recipe.dart';
import 'package:pocketbase/pocketbase.dart';
import '../settings/settings_controller.dart';

class Repository {
  Repository({required this.settingsController});
  final SettingsController settingsController;
  late final client;

  Future<void> auth() async {
    client = PocketBase(settingsController.pbBaseUrl);
    await client.users
        .authViaEmail(settingsController.pbMail, settingsController.pbPass);
  }

  Future<List<Recipe>> getRecipes() async {
    Future<List<RecordModel>> records = client.records.getFullList('pizza_recipes');
    return records.then((records) {
      List<Recipe> recipes = [];
      for (var record in records) {
        recipes.add(Recipe.fromRecord(record));
      }
      return recipes;
    });
  }
}
