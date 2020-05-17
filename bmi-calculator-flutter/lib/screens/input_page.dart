import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/counter.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/routes.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int selectedHeight = 180;
  int selectedWeight = 90;
  int selectedAge = 25;

  void onGenderSelected(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  bool isGenderCurrentlySelected(Gender gender) => gender == selectedGender;

  Color genderSelectorBackgroundForGender(Gender gender) {
    if (selectedGender == gender) {
      return kActiveCardColor;
    } else {
      return kInactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GenderSelector(
                      gender: Gender.Male,
                      isSelected: isGenderCurrentlySelected(Gender.Male),
                      onGenderSelected: onGenderSelected,
                    ),
                  ),
                  Expanded(
                    child: GenderSelector(
                      gender: Gender.Female,
                      isSelected: isGenderCurrentlySelected(Gender.Female),
                      onGenderSelected: onGenderSelected,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: Color(kActiveCardBackground),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "HEIGHT",
                      style: kLabelStyle,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$selectedHeight',
                          style: kCounterTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.0,
                          disabledThumbRadius: 4.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 20.0,
                        ),
                        thumbColor: kAccentColor,
                        overlayColor: kAccentColor.withAlpha(0x29),
                      ),
                      child: Slider(
                        min: 120.0,
                        max: 220.0,
                        value: selectedHeight.toDouble(),
                        inactiveColor: kInactiveTextColor,
                        onChanged: (double newSelectedHeight) {
                          setState(() {
                            selectedHeight = newSelectedHeight.round();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: Color(kActiveCardBackground),
                      child: Counter(
                        counterLabel: "WEIGHT",
                        value: '$selectedWeight',
                        valueLabel: 'kg',
                        onMinusPressed: () {
                          setState(() {
                            selectedWeight--;
                          });
                        },
                        onPlusPressed: () {
                          setState(() {
                            selectedWeight++;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: Color(kActiveCardBackground),
                      child: Counter(
                        counterLabel: "AGE",
                        value: '$selectedAge',
                        valueLabel: 'yo',
                        onPlusPressed: () {
                          setState(() {
                            selectedAge++;
                          });
                        },
                        onMinusPressed: () {
                          setState(() {
                            selectedAge--;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onTap: () {
                BmiCalculator bmiCalculator = BmiCalculator(
                  weight: selectedWeight,
                  height: selectedHeight,
                );

                Navigator.of(context).pushNamed(
                  Routes.kResults,
                  arguments: ResultsPageArguments(
                    bmiAdvice: bmiCalculator.advice(),
                    bmiDescription: bmiCalculator.result(),
                    bmiNumeric: bmiCalculator.calculateBmi(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
