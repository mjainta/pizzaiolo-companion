class Recipe {
  late String name;
  late int ballNo;
  late Map<String, dynamic> poolishIngredients;
  late Map<String, dynamic> doughIngredients;

  Recipe.fromRecord(record) {
    Map<String, dynamic> data = record.data;
    name = data['name'];
    ballNo = data['ball_no'];
    poolishIngredients = data['poolish_ingredients'];
    doughIngredients = data['dough_ingredients'];
  }
  Recipe.fromValues(
      this.name, this.ballNo, this.poolishIngredients, this.doughIngredients);
}
