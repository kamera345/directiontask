import 'package:flutter/material.dart';

import '../Constants/constants.dart';


//All the constants used in this file are taken from Constants/constants.dart file
//This is Reusable container which is used for East and West direction
class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.label});
  final label;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.black45],
          begin: FractionalOffset(0.2, 1),
        ),
      ),
      child: Padding(
        padding:EdgeInsets.only(top: 80.0, bottom: 80.0),
        child: Transform.rotate(
          angle: 95.8,
          child: Container(
            child: Text(label, style: kDirectionContainerTextStyle,),
          ),
        ),
      ),
    );
  }
}