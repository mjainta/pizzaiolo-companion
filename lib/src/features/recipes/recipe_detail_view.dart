import 'package:flutter/material.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_detail_card.dart';
import 'package:pizzaiolo_companion/src/features/recipes/recipe_detail_view_arguments.dart';

/// Displays detailed information about a SampleItem.
class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key});

  static const routeName = '/recipe/view';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RecipeDetailViewArguments;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    args.recipe.name,
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 2),
                  Text(
                    'Recipe for ${args.recipe.ballNo.toString()} dough balls',
                    style: textTheme.subtitle1
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
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
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/flour.png',
                            width: 30,
                          ),
                          name: 'Flour',
                          amount: args.recipe.poolishFlourGr,
                          amountUnit: 'gr',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/water-drop.png',
                            width: 30,
                          ),
                          name: 'Water',
                          amount: args.recipe.poolishWaterMl,
                          amountUnit: 'ml',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/honey.png',
                            width: 30,
                          ),
                          name: 'Honey',
                          amount: args.recipe.poolishHoneyGr,
                          amountUnit: 'gr',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/yeast.png',
                            width: 30,
                          ),
                          name: 'Yeast',
                          amount: args.recipe.poolishYeastGr,
                          amountUnit: 'gr',
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Dough'),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/flour.png',
                            width: 30,
                          ),
                          name: 'Flour',
                          amount: args.recipe.doughFlourGr,
                          amountUnit: 'gr',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/water-drop.png',
                            width: 30,
                          ),
                          name: 'Water',
                          amount: args.recipe.doughWaterMl,
                          amountUnit: 'ml',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/salt.png',
                            width: 30,
                          ),
                          name: 'Salt',
                          amount: args.recipe.doughSaltGr,
                          amountUnit: 'gr',
                        ),
                        RecipeDetailCard(
                          iconImage: Image.asset(
                            'assets/images/icons/olive-oil.png',
                            width: 30,
                          ),
                          name: 'Oil',
                          amount: args.recipe.doughOilGr,
                          amountUnit: 'gr',
                        ),
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
