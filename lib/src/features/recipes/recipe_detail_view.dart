import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_detail_view_arguments.dart';

/// Displays detailed information about a SampleItem.
class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  static const routeName = '/recipe/view';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RecipeDetailViewArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Name: ${args.recipe.name}'),
                  Text(
                      'Recipe for ${args.recipe.ballNo.toString()} dough balls'),
                ],
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
                        const Text('Poolish'),
                        Text('Flour: ${args.recipe.poolishFlourGr} gr'),
                        Text('Water: ${args.recipe.poolishWaterMl} ml'),
                        Text('Honey: ${args.recipe.poolishHoneyGr} gr'),
                        Text('Yeast: ${args.recipe.poolishYeastGr} gr'),
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Dough'),
                        Text('Flour: ${args.recipe.doughFlourGr} gr'),
                        Text('Water: ${args.recipe.doughWaterMl} ml'),
                        Text('Salt: ${args.recipe.doughSaltGr} gr'),
                        Text('Oil: ${args.recipe.doughOilGr} gr'),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 40,
                thickness: 0,
              ),
              const Text('Pizza logs for this recipe:'),
              const Divider(
                height: 10,
                thickness: 0,
              ),
              const Text('Log 1 2022-10-09'),
              const Text('Log 2 2022-10-14'),
              const Text('Log 3 2022-11-02'),
            ],
          ),
        ),
      ),
    );
  }
}
