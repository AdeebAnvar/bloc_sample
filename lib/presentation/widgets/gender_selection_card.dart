import 'package:bloc_sample_app/logic/cubit/gender_cubit.dart';
import 'package:bloc_sample_app/presentation/animation/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCard extends StatelessWidget {
  const GenderSelectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
            BlocBuilder<GenderCubit, GenderState>(
                builder: (context, state) => Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 'male',
                              groupValue:
                                  context.watch<GenderCubit>().state.gender,
                              onChanged: (String? gender) => context
                                  .read<GenderCubit>()
                                  .handleGenderChange(gender.toString()),
                            ),
                            const Text('Male'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 'female',
                              groupValue:
                                  context.watch<GenderCubit>().state.gender,
                              onChanged: (String? gender) => context
                                  .read<GenderCubit>()
                                  .handleGenderChange(gender.toString()),
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ],
                    )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<GenderCubit>()
                        .filterDataByGender(context);
                    if (filterAnimation.isCompleted) {
                      filterAnimationController.reverse();
                    }
                  },
                  child: const Text('Filter'),
                ),
                OutlinedButton(
                  onPressed: () {
                    //*controller.clearSelection,
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void handleGenderChange(String? value, String selectedGender) {
    selectedGender = value!;
  }

  void clearSelection(String selectedGender) {
    selectedGender = '';
  }
}
