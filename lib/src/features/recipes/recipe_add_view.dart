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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                FormBuilderTextField(
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
                const Divider(
                  thickness: 0,
                ),
                FormBuilderSlider(
                  name: 'recipe_ball_no',
                  min: 1,
                  max: 10,
                  initialValue: 4,
                  divisions: 9,
                  decoration: const InputDecoration(
                    labelText: 'Ball number',
                  ),
                ),
                const Divider(
                  height: 40,
                  thickness: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Ingredients Poolish'),
                          FormBuilderTextField(
                            name: 'recipe_poolish_flour_gr',
                            decoration: const InputDecoration(
                              labelText: 'Flour gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_poolish_water_ml',
                            decoration: const InputDecoration(
                              labelText: 'Water ml',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_poolish_honey_gr',
                            decoration: const InputDecoration(
                              labelText: 'Honey gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_poolish_yeast_gr',
                            decoration: const InputDecoration(
                              labelText: 'Yeast gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_poolish_additional_ing',
                            decoration: const InputDecoration(
                              labelText: 'Additional ingredients',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Ingredients Dough'),
                          FormBuilderTextField(
                            name: 'recipe_dough_flour_gr',
                            decoration: const InputDecoration(
                              labelText: 'Flour gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_dough_water_ml',
                            decoration: const InputDecoration(
                              labelText: 'Water ml',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_dough_salt_gr',
                            decoration: const InputDecoration(
                              labelText: 'Salt gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_dough_oil_gr',
                            decoration: const InputDecoration(
                              labelText: 'Oil gr',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'recipe_dough_additional_ing',
                            decoration: const InputDecoration(
                              labelText: 'Additional ingredients',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String name =
                          formKey.currentState?.fields['recipe_name']?.value;
                      int ballNo = formKey
                          .currentState?.fields['recipe_ball_no']?.value
                          .toInt();
                      int poolishFlourGr = int.parse(formKey.currentState
                          ?.fields['recipe_poolish_flour_gr']?.value);
                      int poolishWaterMl = int.parse(formKey.currentState
                          ?.fields['recipe_poolish_water_ml']?.value);
                      int poolishHoneyGr = int.parse(formKey.currentState
                          ?.fields['recipe_poolish_honey_gr']?.value);
                      int poolishYeastGr = int.parse(formKey.currentState
                          ?.fields['recipe_poolish_yeast_gr']?.value);
                      int doughFlourGr = int.parse(formKey.currentState
                          ?.fields['recipe_dough_flour_gr']?.value);
                      int doughWaterMl = int.parse(formKey.currentState
                          ?.fields['recipe_dough_water_ml']?.value);
                      int doughSaltGr = int.parse(formKey
                          .currentState?.fields['recipe_dough_salt_gr']?.value);
                      int doughOilGr = int.parse(formKey
                          .currentState?.fields['recipe_dough_oil_gr']?.value);
                      String poolishAdditionalIng = formKey
                              .currentState
                              ?.fields['recipe_poolish_additional_ing']
                              ?.value ??
                          '';
                      String doughAdditionalIng = formKey.currentState
                              ?.fields['recipe_dough_additional_ing']?.value ??
                          '';
                      var recipe = Recipe.fromValues(
                        name,
                        ballNo,
                        poolishFlourGr,
                        poolishWaterMl,
                        poolishHoneyGr,
                        poolishYeastGr,
                        doughFlourGr,
                        doughWaterMl,
                        doughSaltGr,
                        doughOilGr,
                        poolishAdditionalIng,
                        doughAdditionalIng,
                      );
                      repository.addRecipe(recipe);
                    }
                  },
                  child: const Text('Save Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
