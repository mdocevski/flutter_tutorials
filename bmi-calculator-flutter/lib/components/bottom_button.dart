import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    @required this.onTap,
    @required this.text,
  });

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kCallToActionButtonTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 12.0),
        width: double.infinity,
        color: Color(kBottomContainerColor),
      ),
    );
  }
}
