import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/scorecard.dart';

class Resultloader extends StatefulWidget {
  String s1, s2;

  Resultloader(this.s1, this.s2, {super.key});

  @override
  State<Resultloader> createState() => _ResultloaderState();
}

class _ResultloaderState extends State<Resultloader> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 2300),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scorecard(widget.s1, widget.s2),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedPadding(
            padding: EdgeInsets.zero,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 2300),
            child: Lottie.asset(
              'assets/18378-retro-game-loading-animation.json',
            )),
      ),
    );
  }
}
