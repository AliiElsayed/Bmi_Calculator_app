import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/card_content.dart';
import '../components/reusable_card.dart';
import '../components/buttons.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color leftCardColor = kInactiveCardColor;
  Color rightCardColor = kInactiveCardColor;
  Gender selectedGender;
  int height = 100;
  int weight = 60;
  int age = 20;

//  void cardColorsSelector(Gender gender) {
//    if (gender == Gender.Male) {
//      if (leftCardColor == kInactiveCardColor) {
//        leftCardColor = kActiveCardColor;
//        rightCardColor = kInactiveCardColor;
//      } else {
//        leftCardColor = kInactiveCardColor;
//      }
//    }
//
//    if (gender == Gender.Female) {
//      if (rightCardColor == kInactiveCardColor) {
//        rightCardColor = kActiveCardColor;
//        leftCardColor = kInactiveCardColor;
//      } else {
//        rightCardColor = kInactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(child: Text('Ali elsayed')),
        ],
      ),
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    usedColor: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardContent(
                      genderIcon: FontAwesomeIcons.mars,
                      genderName: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTouch: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    usedColor: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardContent(
                      genderIcon: FontAwesomeIcons.venus,
                      genderName: 'FMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              usedColor: kActiveCardColor,
              cardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumbersStyle,
                        ),
                        Text(
                          'CM',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xffEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 13.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xff858690),
                          overlayColor: Color(0x29EB1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 30,
                          max: 250,
                          onChanged: (double val) {
                            setState(() {
                              height = val.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    usedColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumbersStyle,
                            ),
                            //SizedBox(width: 5.0,),
                            Text(
                              'Kg',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ControllerButton(
                              btnIcon: FontAwesomeIcons.minus,
                              onTouchBtn: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ControllerButton(
                              btnIcon: FontAwesomeIcons.plus,
                              onTouchBtn: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    usedColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ControllerButton(
                                btnIcon: FontAwesomeIcons.minus,
                                onTouchBtn: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            ControllerButton(
                                btnIcon: FontAwesomeIcons.plus,
                                onTouchBtn: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            btnTitle: 'Calculate BMI',
            onPressed: () {
              CalculatorBrain usedCalc =
                  CalculatorBrain(objHeight: height, objWeight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiValue: usedCalc.calculteBMI(),
                          degree: usedCalc.getDegree(),
                          comment: usedCalc.getComment(),
                          degreeColor: usedCalc.getDegreeColor(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
