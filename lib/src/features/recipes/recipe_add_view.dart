import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pizzaiolo_companion/src/classes/recipe.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';

/// Displays detailed information about a SampleItem.
class RecipeAddView extends StatelessWidget {
  const RecipeAddView({
    super.key,
    required this.repository,
  });

  static const routeName = '/recipe/add';

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    name: 'recipe_name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a recipe name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Recipe Name',
                    ),
                  ),
                ),
                Expanded(
                  child: FormBuilderSlider(
                    name: 'recipe_ball_no',
                    min: 1,
                    max: 10,
                    initialValue: 4,
                    divisions: 9,
                    decoration: const InputDecoration(
                      labelText: 'Ball number',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            FormBuilderTextField(
              name: 'recipe_poolish_ingredients',
              decoration: const InputDecoration(
                labelText: 'Poolish Ingredients',
              ),
            ),
            FormBuilderTextField(
              name: 'recipe_dough_ingredients',
              decoration: const InputDecoration(
                labelText: 'Dough Ingredients',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String name =
                      formKey.currentState?.fields['recipe_name']?.value;
                  int ballNo = formKey
                      .currentState?.fields['recipe_ball_no']?.value
                      .toInt();
                  //Map<String, dynamic> poolishIngredients = json.decode(formKey
                  //  .currentState
                  //    ?.fields['recipe_poolish_ingredients']
                  //      ?.value);
                  //Map<String, dynamic> doughIngredients = json.decode(formKey.currentState?.fields['recipe_dough_ingredients']?.value);
                  Map<String, dynamic> poolishIngredients = {
                    "flour": "300gr 00",
                  };
                  Map<String, dynamic> doughIngredients = {
                    "flour": "300gr 00",
                    "water": "300ml",
                  };
                  var recipe = Recipe.fromValues(
                      name, ballNo, poolishIngredients, doughIngredients);
                  repository.addRecipe(recipe);
                }
              },
              child: const Text('Save Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
