import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiValue, @required this.degree, @required this.comment,this.degreeColor});
  final String bmiValue;
  final String degree;
  final String comment;
  final Color degreeColor ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                usedColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      degree, //.toUpperCase()
                      style: TextStyle(
                        fontSize: 25.0,
                        color: degreeColor,
//                        color: degree == 'Normal'
//                            ? kNormalColor
//                            : kOverWeightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiValue,
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Normal BMI range :\n 18.5 - 25 Kg/m2',
                      style:
                          TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      comment,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          BottomButton(
              btnTitle: 'Re_Calculate BMI',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
