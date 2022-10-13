class Recipe {
  late String name;
  late int ballNo;
  late int poolishFlourGr;
  late int poolishWaterMl;
  late int poolishHoneyGr;
  late int poolishYeastGr;
  late int doughFlourGr;
  late int doughWaterMl;
  late int doughSaltGr;
  late int doughOilGr;
  late String poolishAdditionalIng;
  late String doughAdditionalIng;

  Recipe.fromRecord(record) {
    Map<String, dynamic> data = record.data;
    name = data['name'];
    ballNo = data['ball_no'] ?? 1;

    poolishFlourGr = data['poolish_flour_gr'] ?? 0;
    poolishWaterMl = data['poolish_water_ml'] ?? 0;
    poolishHoneyGr = data['poolish_honey_gr'] ?? 0;
    poolishYeastGr = data['poolish_yeast_grr'] ?? 0;
    doughFlourGr = data['dough_flour_gr'] ?? 0;
    doughWaterMl = data['dough_water_ml'] ?? 0;
    doughSaltGr = data['dough_salt_gr'] ?? 0;
    doughOilGr = data['dough_oil_gr'] ?? 0;
    poolishAdditionalIng = data['poolish_additional_ingredients'] ?? '';
    doughAdditionalIng = data['dough_additional_ingredients'] ?? '';
  }
  Recipe.fromValues(
      this.name,
      this.ballNo,
      this.poolishFlourGr,
      this.poolishWaterMl,
      this.poolishHoneyGr,
      this.poolishYeastGr,
      this.doughFlourGr,
      this.doughWaterMl,
      this.doughSaltGr,
      this.doughOilGr,
      this.poolishAdditionalIng,
      this.doughAdditionalIng);
}
