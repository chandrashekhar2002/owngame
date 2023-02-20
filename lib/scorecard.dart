// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/gamescreen.dart';
import 'package:owngame/main.dart';
import 'package:owngame/details.dart';

class Scorecard extends StatefulWidget {
  const Scorecard({Key? key}) : super(key: key);

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {
  String _winner = "";
  String _colored = "";

  @override
  Widget build(BuildContext context) {
    if (store_x > store_y) {
      _winner = names[0];
      _colored = "BLUE";
    } else {
      _winner = names[1];
      _colored = "RED";
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: LottieBuilder.asset(
                "assets/88581-winners-lottie-animation.json"),
          ),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DelayedWidget(
                        child: Text(
                          "Winner : $_winner",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                        delayDuration: Duration(seconds: 1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      DelayedWidget(
                        child: Text(
                          " Color : $_colored ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                          ),
                        ),
                        delayDuration: Duration(seconds: 1),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Lottie.asset("assets/74694-confetti.json",
                        height: 350)),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    )),
                child: SizedBox(
                  height: 150,
                  child:
                      LottieBuilder.asset("assets/133784-back-to-school.json"),
                ),
              ),
              DelayedWidget(
                  animationDuration: Duration(milliseconds: 20),
                  child: Icon(Icons.arrow_left)),
              DelayedWidget(
                  animationDuration: Duration(milliseconds: 20),
                  // delayDuration: Duration(milliseconds: 200),
                  child: Text(" Press this kid to PLAY AGAIN"))
            ],
          ),
        ],
      ),
    );
  }
}
