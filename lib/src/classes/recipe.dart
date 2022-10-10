import 'dart:ffi';

import 'package:pocketbase/pocketbase.dart';

class Recipe {
  Recipe.fromRecord(this._record);

  late final Map<String, dynamic> _data = _record.data;

  final RecordModel _record;

  late final String name = _data['name'];
  late final int ballNo = _data['ball_no'];
  late final Map<String, dynamic> poolishIngredients =
      _data['poolish_ingredients'];
  late final Map<String, dynamic> doughIngredients = _data['dough_ingredients'];
}
