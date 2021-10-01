import 'package:flutter/material.dart';
import '../Constants/constants.dart';


//All the constants used in this file are taken from Constants/constants.dart file
//This is Reusable container which is used for north and south direction
class ReusableContainerTwo extends StatelessWidget {
  ReusableContainerTwo({required this.label, required this.bottomPadding, required this.topPadding});
  final bottomPadding;
  final label;
  final topPadding;

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.black45],
                  begin: FractionalOffset(0.0, 1),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  label,
                  style: kDirectionContainerTextStyle,
                ),
              ),
            ),
          ),
        ),
      );
  }
}
