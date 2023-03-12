// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:owngame/load_widgets/animated_screen.dart';
import 'package:owngame/scorecard.dart';
import 'package:owngame/details.dart';

import 'load_widgets/loaderscreen.dart';
import 'main.dart';

class Gamescreen extends StatefulWidget {
  String p1_name, p2_name;

  Gamescreen(this.p1_name, this.p2_name);

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

int p1 = 0;
int p2 = 0;
double store_x = 0, store_y = 0;
int maxtimer = 3;
int sec = maxtimer;
Timer? timer;

class _GamescreenState extends State<Gamescreen> {
  @override
  void initState() {
    x = XY / 2;
    y = XY / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String player_p1 =
        widget.p1_name.isEmpty ? 'Player 1' : widget.p1_name;
    final String player_p2 =
        widget.p2_name.isEmpty ? 'Player 2' : widget.p2_name;
    // print(safePadding);
    print("This Again $XY");
    // print("$check");
    if (x > 50 && y > 50) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: [
                  GestureDetector(
                    child: Container(
                      height: x,
                      color: Colors.blue,
                      child: Center(
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Text(
                            "$player_p1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        x += 10;
                        y -= 10;
                        p1++;
                        print("x : $x");
                        print("y : $y");
                      });
                    },
                  ),
                ],
              ),
              Column(
                verticalDirection: VerticalDirection.up,
                children: [
                  GestureDetector(
                    child: Container(
                      height: y,
                      color: Colors.redAccent,
                      child: Center(
                        child: Text(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          "$player_p2",
                        ),
                      ),
                    ),
                    onTap: () {
                      print("x : $x");
                      print("y : $y");
                      setState(() {
                        y += 10;
                        x -= 10;
                        p2++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      store_x = x;
      store_y = y;
      x = 859.8095238095239 / 2;
      y = 859.8095238095239 / 2;
      print("Some On LOST LMAO");
      return Resultloader(player_p1, player_p2);
    }
  }

  void sttimer() {
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        sec--;
      });
    });
  }

// Widget  callother() {
//     Future.delayed(Duration(seconds: 3) => return Center(
//     child: Flexible(
//     child: Container(
//       height: 100,width: 80,
//       child: Text("play"),
//       color: Colors.grey.withOpacity(0.4),
//     ),
//   ),
//   ); )
//
// }
}
