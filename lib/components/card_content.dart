import 'package:flutter/material.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  const CardContent({@required this.genderIcon, @required this.genderName});
  final IconData genderIcon;
  final String genderName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 70,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderName,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
