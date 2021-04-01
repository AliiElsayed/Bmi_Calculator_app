import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.btnTitle,@required this.onPressed});
  final String btnTitle;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        height: kBottomContainerHeight,
        //width: double.infinity,
        color: Color(0xffFF0067),
        child: Center(
          child: Text(
            btnTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
