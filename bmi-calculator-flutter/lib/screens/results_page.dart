import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

class ResultsPageArguments {
  ResultsPageArguments({
    @required this.bmiAdvice,
    @required this.bmiDescription,
    @required this.bmiNumeric,
  });

  final double bmiNumeric;
  final String bmiAdvice;
  final String bmiDescription;
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultsPageArguments args = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Your result',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${args.bmiDescription}'.toUpperCase(),
                        style: kBmiDescriptionTextStyle,
                      ),
                      Text(
                        '${args.bmiNumeric.toStringAsFixed(1)}',
                        style: kBmiTextStyle,
                      ),
                      Text(
                        '${args.bmiAdvice}',
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              flex: 5,
            ),
            BottomButton(
              text: 'RE-CALCULATE',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
