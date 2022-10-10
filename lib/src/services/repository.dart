import 'package:pizzaiolo_companion/src/classes/recipe.dart';
import 'package:pizzaiolo_companion/src/features/settings/settings_controller.dart';
import 'package:pocketbase/pocketbase.dart';

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
    Future<List<RecordModel>> records =
        client.records.getFullList('pizza_recipes');
    return records.then((records) {
      List<Recipe> recipes = [];
      for (var record in records) {
        recipes.add(Recipe.fromRecord(record));
      }
      return recipes;
    });
  }

  void addRecipe(Recipe recipe) async {
    final body = <String, dynamic>{
      'name': recipe.name,
      'ball_no': recipe.ballNo,
      'poolish_ingredients': recipe.poolishIngredients,
      'dough_ingredients': recipe.doughIngredients
    };
    await client.records.create('pizza_recipes', body: body);
  }
}
