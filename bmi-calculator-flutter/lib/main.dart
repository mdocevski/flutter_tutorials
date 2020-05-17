import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      initialRoute: Routes.kHome,
      routes: routesMap,
    );
  }
}
