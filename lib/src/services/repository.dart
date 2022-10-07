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

  Future<List<RecordModel>> getRecipes() async {
    var records = client.records.getFullList('pizza_recipes');
    print(records);
    return records;
  }
}
