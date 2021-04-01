import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.objHeight, @required this.objWeight});
  final int objHeight;
  final int objWeight;
  double _bmi;

  String calculteBMI() {
    _bmi = objWeight / pow(objHeight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getDegree() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more..';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
  Color getDegreeColor(){
    if (_bmi >= 25) {
      return  kOverWeightColor;
    } else if (_bmi >= 18.5) {
      return kNormalColor;
    } else {
      return kUnderWeightColor;
    }
  }
}
