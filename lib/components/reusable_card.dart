import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  const ReusableCard({this.usedColor, this.cardChild, this.onTouch});
  final Color usedColor;
  final Widget cardChild;
  final Function onTouch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTouch ,
      child: Container(
//        height: double.infinity,
        width: double.infinity,
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: usedColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

