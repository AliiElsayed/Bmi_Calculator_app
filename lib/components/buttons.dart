import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  ControllerButton({@required this.btnIcon, @required this.onTouchBtn});
  final IconData btnIcon;
  final Function onTouchBtn;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      constraints: BoxConstraints.tightFor(
        height: 57.0,
        width: 57.0,
      ),
      fillColor: Color(0x208B8C96),
      child: Icon(
        btnIcon,
        color: Colors.white,
      ),
      onPressed: onTouchBtn,
    );
  }
}
