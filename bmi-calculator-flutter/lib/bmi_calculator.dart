import 'dart:math';

import 'package:flutter/cupertino.dart';

const kOverweightStartingValue = 25.0;
const kNormalWeightStartingValue = 18.5;

class BmiCalculator {
  BmiCalculator({
    @required this.height,
    @required this.weight,
  });

  final int height;
  final int weight;

  double calculateBmi() => weight / pow(height / 100, 2);

  String result() {
    double bmi = calculateBmi();

    if (bmi >= kOverweightStartingValue) {
      return 'Overweight';
    } else if (bmi >= kNormalWeightStartingValue) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String advice() {
    double bmi = calculateBmi();

    if (bmi >= kOverweightStartingValue) {
      return 'You should loose some weight';
    } else if (bmi >= kNormalWeightStartingValue) {
      return 'You\'re just normal';
    } else {
      return 'You ain\'t got enough meat on your bones';
    }
  }
}
