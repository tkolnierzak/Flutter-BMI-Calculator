import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTapScreen, this.buttonText});
  String buttonText;

  Function onTapScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapScreen,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
