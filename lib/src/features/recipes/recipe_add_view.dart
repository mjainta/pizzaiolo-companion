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
      body: Container(
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
                        FormBuilderTextField(
                          name: 'recipe_poolish_flour',
                          decoration: const InputDecoration(
                            labelText: 'Poolish Flour',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_poolish_water',
                          decoration: const InputDecoration(
                            labelText: 'Poolish Water',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_poolish_honey',
                          decoration: const InputDecoration(
                            labelText: 'Poolish Honey',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_poolish_yeast',
                          decoration: const InputDecoration(
                            labelText: 'Poolish Yeast',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'recipe_dough_flour',
                          decoration: const InputDecoration(
                            labelText: 'Dough Flour',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_dough_water',
                          decoration: const InputDecoration(
                            labelText: 'Dough Water',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_dough_salt',
                          decoration: const InputDecoration(
                            labelText: 'Dough Salt',
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'recipe_dough_oil',
                          decoration: const InputDecoration(
                            labelText: 'Dough Oil',
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
                    //Map<String, dynamic> poolishIngredients = json.decode(formKey
                    //  .currentState
                    //    ?.fields['recipe_poolish_ingredients']
                    //      ?.value);
                    //Map<String, dynamic> doughIngredients = json.decode(formKey.currentState?.fields['recipe_dough_ingredients']?.value);
                    Map<String, dynamic> poolishIngredients = {
                      "flour": formKey.currentState
                              ?.fields['recipe_poolish_flour']?.value ??
                          '',
                      "water": formKey.currentState
                              ?.fields['recipe_poolish_water']?.value ??
                          '',
                      "honey": formKey.currentState
                              ?.fields['recipe_poolish_honey']?.value ??
                          '',
                      "yeast": formKey.currentState
                              ?.fields['recipe_poolish_yeast']?.value ??
                          '',
                    };
                    Map<String, dynamic> doughIngredients = {
                      "flour": formKey.currentState
                              ?.fields['recipe_dough_flour']?.value ??
                          '',
                      "water": formKey.currentState
                              ?.fields['recipe_dough_water']?.value ??
                          '',
                      "salt": formKey.currentState?.fields['recipe_dough_salt']
                              ?.value ??
                          '',
                      "oil": formKey.currentState?.fields['recipe_dough_oil']
                              ?.value ??
                          '',
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
      ),
    );
  }
}
