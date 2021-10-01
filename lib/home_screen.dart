import 'dart:async';
import 'package:directiontask/ReusableContent/reusable_container_two.dart';
import 'package:directiontask/ReusableContent/reusable_content_one.dart';
import 'package:directiontask/pop_alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //Animation Controller
  // We defined it late because
  late AnimationController animationController;
  late Animation animation;


  /*
  * The below model function is the main part to detect the direction
  * The used data in order to detect the direction is taken by manual observations
  * on the process
  * */
  String model(int data) {
    String result = '';

    if (data > 0 && data < 19 ||
        data > 108 && data < 142 ||
        data > 211 && data > 257 ||
        data > 324 && data < 360) {
      result = 'west';
    }

    if (data > 19 && data < 40 ||
        data > 142 && data < 166 ||
        data > 257 && data < 280) {
      result = 'South';
    }
    if (data > 40 && data < 78 ||
        data > 166 && data < 195 ||
        data > 280 && data > 310) {
      result = 'East';
    }
    if (data > 78 && data < 107 ||
        data > 195 && data < 210 ||
        data > 310 && data > 324) {
      result = 'North';
    }

    return result;
  }

  /*

  The Below we have repeatAnimation function
  In this method we stop the animation or the rotation of the image after 10s
  And we are calling the popup dailouge 1s after the animation stopped.
  using Future.delay
   */
  repeatAnimation() {
    animationController.stop();
    model((animation.value).round());
    Future.delayed(
      Duration(milliseconds: 1000),
      // The AlertBox is taken from the
      () => showDialog(
          context: context,
          builder: (context) => AlertBox(
                label: model((animation.value).round()),
              )),
    );
  }

//Here we initializing the animation controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );

    animation =
        Tween<double>(begin: 358.1, end: 0.0).animate(animationController);
  }

  //Here we are disposing the animation controller after the app gets disposed
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      The below container is the Container for the whole widgets
      */
      body: Container(
        // we are taking the whole available height and width(screen size),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   colors: [Colors.cyan, Colors.black45],
          //   begin: FractionalOffset(0.2, 1),
          // ),
        ),
        /*In the below column we are going to place all our widgets*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /**/
            //The below ReusableContainerTwo statelesswidget which is taken from the ReusableContent/reusable_container_two
            //Which contains the North Direction content
            //All the provided fields are must required
            ReusableContainerTwo(
              label: 'North',
              bottomPadding: 0.0,
              topPadding: 80.0,
             // colors: model((animation.value).round())=='North'? Colors.deepOrangeAccent: Colors.black45,
            ),

            /*
          *The below Container Contains the Two East and West directions and image(rotater)
          * And It conatins a reusable stateless widget
          * so, for any modifications to them go to RerusableContent/reusable_content_one file
          * The constants used in this are taken from Constants/constants.dart file
          * */
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /*
                  * The below Reuasble Container is taken from the ReusableContent/reusable_container_one file
                  * which conatins the west direction
                  * */
                  ReusableContainer(label: 'West',
                  //colors:  model((animation.value).round())=='West'? Colors.deepOrangeAccent: Colors.black45,
                  ),
                  //The below is the Expanded widget which contains image which is the direction picker
                  //Inside we have a container which is wrapped with gesture detector
                  // We used Future.delayed to stop the animation 10s after the animation
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          animationController.repeat();
                          Future.delayed(
                            Duration(seconds: 10),
                            () => repeatAnimation(),
                          );
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          child: new Container(
                            height: 150.0,
                            width: 150.0,
                            child: new Image.asset('images/pen.jpg'),
                          ),
                          builder: (context, _widget) {
                            return new Transform.rotate(
                              //angle:animationController.value*10.0*23.9,
                              angle: animation.value,
                              child: _widget,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  /*
                  * The below Reuasble Container is taken from the ReusableContent/reusable_container_one file
                  * which contins the East direction
                  * */
                  ReusableContainer(label: 'East',
                   //colors: model((animation.value).round())=='East'? Colors.deepOrangeAccent: Colors.black45,
                  ),
                ],
              ),
            ),

            /**/
            //The below ReusableContainerTwo statelesswidget which is taken from the ReusableContent/reusable_container_two
            //Which contains the Sputh Direction content
            //All the provided fields are must required
            ReusableContainerTwo(
              label: 'South',
              bottomPadding: 80.0,
              topPadding: 0.0,
              //colors:  model((animation.value).round())=='South'? Colors.deepOrangeAccent: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
