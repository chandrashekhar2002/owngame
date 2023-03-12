// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/gamescreen.dart';
import 'package:owngame/main.dart';
import 'package:owngame/details.dart';

class Scorecard extends StatefulWidget {

  String player1,player2;

  Scorecard(this.player1, this.player2);

  @override
  State<Scorecard> createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard> {
  String _winner = "";
  String _colored = "";
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (store_x > store_y) {
      _winner = widget.player1;
      _colored = "BLUE";
    } else {
      _winner = widget.player2;
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
            child: LottieBuilder.asset(box.get('image'),onLoaded: (p0) {
              _isloading = true;
            },),
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

          DelayedWidget(
            delayDuration: Duration(seconds: 2),
            child: GestureDetector(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.replay, size: 40,
                      color: Colors.blue,
                      shadows: [Shadow(color: Colors.grey, blurRadius: 2.2)]),
                  Text(' Play Again...'),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gamescreen(widget.player1,widget.player2),));
              },
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.push(
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
                  animationDuration: Duration(seconds: 2),
                  // delayDuration: Duration(milliseconds: 200),
                  child: Text(" Press this kid to PLAY AGAIN")),
            ],
          ),
        ],
      ),
    );
  }
}
