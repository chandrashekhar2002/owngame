import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/gamescreen.dart';

class Splashscreenbeforegame extends StatefulWidget {
  const Splashscreenbeforegame({Key? key}) : super(key: key);

  @override
  State<Splashscreenbeforegame> createState() => _SplashscreenbeforegameState();
}

class _SplashscreenbeforegameState extends State<Splashscreenbeforegame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          const Opacity(opacity: 0.5),
          Lottie.asset('assets/97154-count-down-transparent.json',
              animate: true, repeat: false),
          // Column(
          //   children: [
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       verticalDirection: VerticalDirection.down,
          //       children: [
          //         GestureDetector(
          //           child: Container(
          //             height: x,
          //             color: Colors.blue,
          //             child: Center(
          //               child: RotatedBox(
          //                 quarterTurns: 2,
          //                 child: Text(
          //                   "p1",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 30,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           onTap: () {
          //             setState(() {
          //               x += 10;
          //               y -= 10;
          //               p1++;
          //               print("x : $x");
          //               print("y : $y");
          //             });
          //           },
          //         ),
          //       ],
          //     ),
          //     Column(
          //       verticalDirection: VerticalDirection.up,
          //       children: [
          //         GestureDetector(
          //           child: Container(
          //             height: y,
          //             color: Colors.redAccent,
          //             child: Center(
          //               child: Text(
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 30,
          //                 ),
          //                 "p2",
          //               ),
          //             ),
          //           ),
          //           onTap: () {
          //             print("x : $x");
          //             print("y : $y");
          //             setState(() {
          //               y += 10;
          //               x -= 10;
          //               p2++;
          //             });
          //           },
          //         ),
          //       ],
          //     ),
          //   ],
          // )
        ]),
      ),
    );
  }
}
