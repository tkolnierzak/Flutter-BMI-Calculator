import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

const labelIconSize = 80.0;

class IconContent extends StatelessWidget {
  IconContent({
    @required this.iconWidget,
    @required this.textWidget,
  });
  final IconData iconWidget;
  final String textWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconWidget,
          size: labelIconSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textWidget,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
