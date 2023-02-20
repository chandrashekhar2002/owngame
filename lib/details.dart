// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:owngame/gamescreen.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

List<String> names = ["PLAYER 1", "PLAYER 2"];

class _UserDetailsState extends State<UserDetails> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(220, 237, 185, 25),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              DelayedWidget(
                animationDuration: Duration(milliseconds: 200),
                child: Text(
                  "Before Starting .... ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DelayedWidget(
                animationDuration: Duration(milliseconds: 200),
                child: Text("Let's Enter the Players Name",
                    style: TextStyle(fontSize: 25)),
              ),
              SizedBox(
                height: 50,
              ),
              DelayedWidget(
                delayDuration: Duration(milliseconds: 500),
                animation: DelayedAnimations.SLIDE_FROM_TOP,
                child: Column(
                  children: [
                    TextField(
                      controller: name1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        hintText: " Player 1 Name ",
                        suffixIcon: Icon(Icons.square, color: Colors.blue),
                        prefixIconColor: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player 1's side is : "),
                        Icon(Icons.arrow_upward)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              DelayedWidget(
                delayDuration: Duration(milliseconds: 1000),
                animation: DelayedAnimations.SLIDE_FROM_TOP,
                child: Column(
                  children: [
                    TextField(
                      controller: name2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        hintText: " Player 2 Name ",
                        suffixIcon: Icon(Icons.square, color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player 1's side is : "),
                        Icon(Icons.arrow_downward)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              DelayedWidget(

                delayDuration: Duration(milliseconds: 1500),
                child: ElevatedButton(
                  onPressed: () {
                    String p1_name = name1.text.trim().toString();
                    String p2_name = name2.text.trim().toString();
                    print(p1_name);
                    print(p2_name);
                    if (p1_name.isNotEmpty) {
                      names[0] = p1_name;
                    }
                    if (p2_name.isNotEmpty) {
                      names[1] = p2_name;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gamescreen()),
                    );
                  },
                  child: Text("PLAY WITH NAMES"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              DelayedWidget(

                delayDuration: Duration(milliseconds: 2000),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Gamescreen(),
                      )),
                  child: Text("PLAY WITH OUT NAMES"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
