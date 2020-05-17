import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0A0E21);
const kScaffoldBackgroundColor = Color(0xFF090C22);

const kAccentColor = Color(0xFFEB1555);

const kActiveCardBackground = 0xFF1D1E33;
const kActiveCardColor = Color(kActiveCardBackground);
const kInactiveCardBackground = 0xFF111328;
const kInactiveCardColor = Color(kInactiveCardBackground);

var lightTheme = ThemeData.dark().copyWith(
  accentColor: kAccentColor,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  primaryColor: kPrimaryColor,
);

const kInactiveTextColor = Color(0xFF8D8E98);

const kCircleButtonBackgroundColor = Color(0xFF4C4F5e);

const kLabelStyle = TextStyle(
  fontSize: 20.0,
  color: kInactiveTextColor,
);

const kCounterTextStyle = TextStyle(
  fontSize: 50.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kCallToActionButtonTextStyle = TextStyle(
  fontSize: 32.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kBottomContainerColor = 0xFFEB1555;
const double kBottomContainerHeight = 80.0;

const kBmiTextStyle = TextStyle(
  fontSize: 86.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

const kBodyTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
);

const kBmiDescriptionTextStyle = TextStyle(
  fontSize: 22.0,
  color: kUnderweightColor,
  fontWeight: FontWeight.bold,
);

const kUnderweightColor = Color(0xFF24d876);
