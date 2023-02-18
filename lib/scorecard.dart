// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/gamescreen.dart';
import 'package:owngame/main.dart';

class Scorecard extends StatefulWidget {
  const Scorecard({Key? key}) : super(key: key);

  @override
  State<Scorecard> createState() => _ScorecardState();
}

String winner = "";
String colored = "";

class _ScorecardState extends State<Scorecard> {
  @override
  Widget build(BuildContext context) {
    if (store_x > store_y) {
      winner = "1";
      colored = "BLUE";
    } else {
      winner = "2";
      colored = "RED";
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
                      Text(
                        "Winner : PLAYER $winner",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        " Color : $colored ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(child: Lottie.asset("assets/74694-confetti.json", height: 350)),
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
              Icon(Icons.arrow_left),
              Text(" Press this kid to PLAY AGAIN")
            ],
          ),
        ],
      ),
    );
  }
}
