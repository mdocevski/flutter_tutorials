import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

import 'round_icon_button.dart';

class Counter extends StatelessWidget {
  Counter(
      {@required this.counterLabel,
      @required this.value,
      this.valueLabel,
      @required this.onMinusPressed,
      @required this.onPlusPressed});

  final String value;
  final String counterLabel;
  final String valueLabel;
  final Function onMinusPressed;
  final Function onPlusPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$counterLabel',
          style: kLabelStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              '$value',
              style: kCounterTextStyle,
            ),
            Text(
              '$valueLabel',
              style: kLabelStyle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              iconData: Icons.add,
              onPressed: onPlusPressed,
            ),
            SizedBox(
              width: 8.0,
            ),
            RoundIconButton(
              iconData: Icons.remove,
              onPressed: onMinusPressed,
            ),
          ],
        ),
      ],
    );
  }
}
