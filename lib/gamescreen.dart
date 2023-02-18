// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:owngame/scorecard.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({Key? key}) : super(key: key);

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

double x = 859.8095238095239 / 2;
double y = 859.8095238095239 / 2;

int p1 = 0;
int p2 = 0;
double store_x=0,store_y=0;

class _GamescreenState extends State<Gamescreen> {
  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    double XY = MediaQuery.of(context).size.height - safePadding;
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
                            "Player 1 ",
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
                          "Player 2 ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
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
      return Scorecard();
    }
  }
}
