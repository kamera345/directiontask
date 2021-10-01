import 'package:flutter/material.dart';

import 'Constants/constants.dart';


//All the constants used in this file are taken from Constants/constants.dart file
// Its an alert box which displays the direction
// In this we have textSpan, textButton, Text
class AlertBox extends StatelessWidget {
 AlertBox({this.label});
  final label;

  @override
  Widget build(BuildContext context) {
    //print(label);
    const String firstText = 'Pen pointing to the';
    const String lastText = 'direction';
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.black45],
          begin: FractionalOffset(0.2, 1),
        ),
      ),
      child: AlertDialog(
        backgroundColor: Colors.white70,
        title: Text('← Back', style: kPopUpBoxTextStyle),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text.rich(
                TextSpan(
                  text: '$firstText   ',
                  style: kPopUpBoxTextStyle,
                  children: <InlineSpan>[
                    TextSpan(
                      text: '$label ',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                    TextSpan(
                      text: lastText,
                      style: kPopUpBoxTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          //The below is the text button to exit the box
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.cyan[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
