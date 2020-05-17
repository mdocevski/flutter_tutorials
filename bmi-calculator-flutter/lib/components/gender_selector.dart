import 'package:bmi_calculator/components/icon_with_label.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class GenderSelector extends StatelessWidget {
  GenderSelector({
    @required this.gender,
    @required this.isSelected,
    @required this.onGenderSelected,
  });

  IconData genderIcon() =>
      gender == Gender.Male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus;

  String genderText() => gender == Gender.Male ? 'MALE' : 'FEMALE';

  final Gender gender;
  final Function(Gender) onGenderSelected;
  final bool isSelected;

  Color getColor() {
    if (isSelected) {
      return kActiveCardColor;
    } else {
      return kInactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onGenderSelected(gender);
      },
      child: ReusableCard(
        color: getColor(),
        child: IconWithLabel(
          iconData: genderIcon(),
          label: genderText(),
        ),
      ),
    );
  }
}
