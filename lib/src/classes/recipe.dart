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
    ballNo = data['ball_no'];

    poolishFlourGr = data['poolish_flour_gr'];
    poolishWaterMl = data['poolish_water_ml'];
    poolishHoneyGr = data['poolish_honey_gr'];
    poolishYeastGr = data['poolish_yeast_grr'];
    doughFlourGr = data['dough_flour_gr'];
    doughWaterMl = data['dough_water_ml'];
    doughSaltGr = data['dough_salt_gr'];
    doughOilGr = data['dough_oil_gr'];
    poolishAdditionalIng = data['poolish_additional_ingredients'];
    doughAdditionalIng = data['dough_additional_ingredients'];
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
