// ignore_for_file: prefer_const_constructors

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:owngame/details.dart';
import 'package:provider/provider.dart';
import 'gamescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Data_Box');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
  debugPrint('New Commit 1');
}

double XY = 0.00;
double xx = 0.00;
double yy = 0.00;
double x = 0.00;
double y = 0.00;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final box = Hive.box('Data_Box');

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    box.put('image', 'assets/88581-winners-lottie-animation.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    XY = MediaQuery.of(context).size.height - safePadding;
    x = XY / 2;
    y = XY / 2;
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 185, 25),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              LottieBuilder.asset("assets/51971-hello.json", height: 270),
              SizedBox(
                height: 20,
              ),
              DelayedWidget(
                  delayDuration: Duration(milliseconds: 500),
                  animation: DelayedAnimations.SLIDE_FROM_TOP,
                  child: Text(
                    "Hello and Welcome ",
                    style: TextStyle(fontSize: 28),
                  )),
              SizedBox(
                height: 30,
              ),
              DelayedWidget(
                  delayDuration: Duration(milliseconds: 1000),
                  animation: DelayedAnimations.SLIDE_FROM_TOP,
                  child: Text(
                    "Challenge your friend if they win take them for some treat : )  ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 30,
              ),
              // DelayedWidget(
              //     delayDuration: Duration(milliseconds: 1500),
              //     animation: DelayedAnimations.SLIDE_FROM_TOP,
              //     child: Text(
              //         style: TextStyle(fontSize: 15, color: Colors.black),
              //         "- This game is currently in development stage (LMAO) nvm ")),
              SizedBox(
                height: 30,
              ),
              // DelayedWidget(
              //     delayDuration: Duration(milliseconds: 2000),
              //     animation: DelayedAnimations.SLIDE_FROM_TOP,
              //     child: Text(
              //       "- We are adding new features but it takes time...",
              //       style: TextStyle(fontSize: 15, color: Colors.black),
              //     )),
              SizedBox(
                height: 30,
              ),
              // DelayedWidget(
              //     delayDuration: Duration(milliseconds: 2500),
              //     animation: DelayedAnimations.SLIDE_FROM_TOP,
              //     child: Text(
              //         style: TextStyle(fontSize: 15, color: Colors.black),
              //         "- bcoz our developer is d laziest guy in the world -_-")),
              SizedBox(
                height: 30,
              ),
              // DelayedWidget(
              //     delayDuration: Duration(milliseconds: 3000),
              //     animation: DelayedAnimations.SLIDE_FROM_TOP,
              //     child: Text("- Enough of Chat and lets jump into the game ")),
              SizedBox(
                height: 30,
              ),
              DelayedWidget(
                  delayDuration: Duration(milliseconds: 3500),
                  animation: DelayedAnimations.SLIDE_FROM_TOP,
                  child: Text("- HAVE FUN :) ")),
              SizedBox(
                height: 30,
              ),
              DelayedWidget(
                delayDuration: Duration(milliseconds: 4000),
                animation: DelayedAnimations.SLIDE_FROM_TOP,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetails(),
                    ),
                  ),
                  child: Text(
                    " WHO  TAPS  FAST ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(child: Text("")),
              Text(
                "You Can't beat creater btw",
                style: TextStyle(fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
