import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pizzaiolo_companion/src/classes/log.dart';
import 'package:pizzaiolo_companion/src/services/repository.dart';

/// Displays detailed information about a SampleItem.
class LogAddView extends StatelessWidget {
  const LogAddView({
    super.key,
    required this.repository,
  });

  static const routeName = '/log/add';

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'pizza_recipes',
                  initialValue: '0kk48zgr0t9qyfn',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose a recipe';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Recipe',
                  ),
                ),
                FormBuilderSlider(
                  name: 'poolish_rest_hr',
                  min: 1,
                  max: 48,
                  initialValue: 18,
                  divisions: 47,
                  decoration: const InputDecoration(
                    labelText: 'Poolish rest hours',
                  ),
                ),
                FormBuilderSlider(
                  name: 'ball_no_multiplier',
                  min: 1,
                  max: 10,
                  initialValue: 1,
                  divisions: 9,
                  decoration: const InputDecoration(
                    labelText: 'Ball no. multiplier',
                  ),
                ),
                FormBuilderTextField(
                  name: 'notable_changes',
                  decoration: const InputDecoration(
                    labelText: 'Notable changes',
                  ),
                ),
                FormBuilderTextField(
                  name: 'room_temperature',
                  initialValue: 'medium',
                  decoration: const InputDecoration(
                    labelText: 'Temperature',
                  ),
                ),
                FormBuilderSlider(
                  name: 'rating_processability',
                  min: 1,
                  max: 5,
                  initialValue: 4,
                  divisions: 4,
                  decoration: const InputDecoration(
                    labelText: 'Rating Processability',
                  ),
                ),
                FormBuilderSlider(
                  name: 'rating_fluffyness',
                  min: 1,
                  max: 5,
                  initialValue: 4,
                  divisions: 4,
                  decoration: const InputDecoration(
                    labelText: 'Rating Fluffyness',
                  ),
                ),
                FormBuilderSlider(
                  name: 'rating_taste',
                  min: 1,
                  max: 5,
                  initialValue: 4,
                  divisions: 4,
                  decoration: const InputDecoration(
                    labelText: 'Rating Taste',
                  ),
                ),
                FormBuilderTextField(
                  name: 'rating_notes',
                  decoration: const InputDecoration(
                    labelText: 'Rating notes',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // String name =
                      //     formKey.currentState?.fields['pizza_recipes']?.value;
                      // int ballNo = formKey
                      //     .currentState?.fields['recipe_ball_no']?.value
                      //     .toInt();
                      // int poolishFlourGr = int.parse(formKey.currentState
                      //     ?.fields['recipe_poolish_flour_gr']?.value);
                      // int poolishWaterMl = int.parse(formKey.currentState
                      //     ?.fields['recipe_poolish_water_ml']?.value);
                      // int poolishHoneyGr = int.parse(formKey.currentState
                      //     ?.fields['recipe_poolish_honey_gr']?.value);
                      // int poolishYeastGr = int.parse(formKey.currentState
                      //     ?.fields['recipe_poolish_yeast_gr']?.value);
                      // int doughFlourGr = int.parse(formKey.currentState
                      //     ?.fields['recipe_dough_flour_gr']?.value);
                      // int doughWaterMl = int.parse(formKey.currentState
                      //     ?.fields['recipe_dough_water_ml']?.value);
                      // int doughSaltGr = int.parse(formKey
                      //     .currentState?.fields['recipe_dough_salt_gr']?.value);
                      // int doughOilGr = int.parse(formKey
                      //     .currentState?.fields['recipe_dough_oil_gr']?.value);
                      // String poolishAdditionalIng = formKey
                      //         .currentState
                      //         ?.fields['recipe_poolish_additional_ing']
                      //         ?.value ??
                      //     '';
                      // String doughAdditionalIng = formKey.currentState
                      //         ?.fields['recipe_dough_additional_ing']?.value ??
                      //     '';
                      var log = Log.fromValues(
                        DateTime.now(),
                        18,
                        1,
                        'none',
                        'medium',
                        1,
                        2,
                        3,
                        'notes',
                      );
                      repository.addLog(log);
                    }
                  },
                  child: const Text('Save Log'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
