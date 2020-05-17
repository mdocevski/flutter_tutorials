import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.iconData,
    @required this.onPressed,
  });

  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      disabledElevation: 6.0,
      fillColor: kCircleButtonBackgroundColor,
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}
