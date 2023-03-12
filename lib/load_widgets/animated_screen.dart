// ignore_for_file: unused_import
// import 'dart:html';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/gamescreen.dart';

class Splashscreenbeforegame extends StatefulWidget {
  String? Player1name, Player2name;

  @override
  State<Splashscreenbeforegame> createState() => _SplashscreenbeforegameState();

  Splashscreenbeforegame(this.Player1name, this.Player2name);
}

class _SplashscreenbeforegameState extends State<Splashscreenbeforegame> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 2800),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Gamescreen(
                      widget.Player1name.toString(),
                      widget.Player2name.toString())),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Lottie.asset('assets/106663-gaming-loading-animation.json'),
            const SizedBox(
              height: 40,
            ),
            DelayedWidget(
              animation: DelayedAnimations.SLIDE_FROM_LEFT,
              animationDuration: Duration(seconds: 1),
              child: Lottie.asset(
                'assets/97154-count-down-transparent.json',
                animate: true,
                repeat: true,
                height: 150,
              ),
            ),
          ],
        ),
        // child: Lottie.asset('assets/97154-count-down-transparent.json',
        //     animate: true, repeat: false),
      ),
    );
  }
}
