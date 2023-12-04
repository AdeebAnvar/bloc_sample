import 'package:bloc_sample_app/presentation/animation/animations.dart';
import 'package:bloc_sample_app/presentation/widgets/gender_selection_card.dart';
import 'package:flutter/material.dart';

class FilterScreenStackMobile extends StatelessWidget {
  const FilterScreenStackMobile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: filterAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(filterAnimation.value, 0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal[700],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const GenderSelectionCard(),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
