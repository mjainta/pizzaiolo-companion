import 'package:pizzaiolo_companion/src/classes/log.dart';
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
    return records.then((records) async {
      List<Recipe> recipes = [];
      for (var record in records) {
        Recipe recipe = Recipe.fromRecord(record);
        recipe.logs = await getLogs();
        recipes.add(recipe);
      }
      return recipes;
    });
  }

  void addRecipe(Recipe recipe) async {
    final body = <String, dynamic>{
      'name': recipe.name,
      'ball_no': recipe.ballNo,
      'poolish_flour_gr': recipe.poolishFlourGr,
      'poolish_water_ml': recipe.poolishWaterMl,
      'poolish_honey_gr': recipe.poolishHoneyGr,
      'poolish_yeast_grr': recipe.poolishYeastGr,
      'dough_flour_gr': recipe.doughFlourGr,
      'dough_water_ml': recipe.doughWaterMl,
      'dough_salt_gr': recipe.doughSaltGr,
      'dough_oil_gr': recipe.doughOilGr,
      'poolish_additional_ingredients': recipe.poolishAdditionalIng,
      'dough_additional_ingredients': recipe.doughAdditionalIng,
    };
    await client.records.create('pizza_recipes', body: body);
  }

  Future<List<Log>> getLogs() async {
    Future<List<Log>> logs = Future.delayed(
      const Duration(milliseconds: 100),
      () => [
        Log.fromValues(
          DateTime.parse('2022-10-19 19:13:17'),
          18,
          1,
          'none',
          'medium',
          2,
          3,
          2,
          'overall good experience',
        ),
        Log.fromValues(
          DateTime.parse('2022-10-19 19:13:17'),
          24,
          1,
          '',
          'high',
          1,
          5,
          3,
          '',
        ),
        Log.fromValues(
          DateTime.parse('2022-10-19 19:13:17'),
          12,
          1,
          'none',
          'small',
          2,
          3,
          2,
          'overall good experience',
        ),
      ],
    );

    return logs;
  }

  void addLog(Log log) async {
    // final body = <String, dynamic>{
    //   'pizza_recipes': recipe.id,
    //   'poolish_rest_hr': log.poolishRestHr,
    //   'ball_no_multiplier': log.ballNoMultiplier,
    //   'notable_changes': log.notableChanges,
    //   'room_temperature': log.roomTemperature,
    //   'rating_processability': log.ratingProcessability,
    //   'rating_fluffyness': log.ratingFluffyness,
    //   'rating_taste': log.ratingTaste,
    //   'rating_notes': log.ratingNotes,
    // };
    final body = <String, dynamic>{
      'pizza_recipes': '0kk48zgr0t9qyfn',
      'poolish_rest_hr': 18,
      'ball_no_multiplier': 1,
      'notable_changes': 'changes',
      'room_temperature': 'medium',
      'rating_processability': 2,
      'rating_fluffyness': 3,
      'rating_taste': 1,
      'rating_notes': 'super duper',
    };
    await client.records.create('pizza_logs', body: body);
  }
}
