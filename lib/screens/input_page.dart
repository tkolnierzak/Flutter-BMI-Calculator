import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/gender_enum.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: ReusableCard(
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconWidget: FontAwesomeIcons.mars,
                      textWidget: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                        iconWidget: FontAwesomeIcons.venus,
                        textWidget: 'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
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
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  weight -= 10;
                                });
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressButton: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  weight += 10;
                                });
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressButton: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  age -= 10;
                                });
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressButton: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  age += 10;
                                });
                              },
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressButton: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTapScreen: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              calc.calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResult(),
                    bmiResult: calc.calculateBMI(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
