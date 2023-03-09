// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:owngame/gamescreen.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

//
// List<String> names = ["PLAYER 1", "PLAYER 2"];
String msg = '', msg1 = '';
bool isNotEmpty = false, isNotEmpty1 = false;

class _UserDetailsState extends State<UserDetails> {
  TextEditingController name1 = TextEditingController();
  TextEditingController name2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(' BuildContext context : $context ');
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
                      maxLength: 5,
                      controller: name1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        hintText: " Player 1 Name ",
                        suffixIcon: Icon(Icons.circle, color: Colors.blue),
                        prefixIconColor: Colors.blue,
                      ),
                      onChanged: (value) {
                        if (value.length == 5) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      msg,
                      style: TextStyle(color: Colors.red),
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
                height: 30,
              ),
              DelayedWidget(
                delayDuration: Duration(milliseconds: 1000),
                animation: DelayedAnimations.SLIDE_FROM_TOP,
                child: Column(
                  children: [
                    TextField(
                      maxLength: 5,
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
                        suffixIcon: Icon(Icons.circle, color: Colors.red),
                      ),
                      onChanged: (value) {
                        if (value.length == 5) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      msg1,
                      style: TextStyle(color: Colors.red),
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
                    String p1name = '', p2name = '';
                    String p1_name = name1.text.trim().toString();
                    String p2_name = name2.text.trim().toString();
                    if (p1_name.isEmpty && p2_name.isEmpty) {
                      setState(() {
                        msg = 'Please enter the Names ';
                        msg1 = 'Please enter the Names ';
                        isNotEmpty = true;
                        isNotEmpty1 = true;
                      });
                    } else if (p1_name.isEmpty && p2_name.isNotEmpty) {
                      setState(() {
                        msg1 = '';
                        msg = 'Please Enter Player 1 Name ';
                        isNotEmpty = true;
                      });
                    } else if (p1_name.isNotEmpty && p2_name.isEmpty) {
                      setState(() {
                        msg = '';
                        msg1 = 'Please Enter Player 2 Name ';
                        isNotEmpty1 = true;
                      });
                    } else {
                      msg = '';
                      msg1 = '';
                      print(p1_name);
                      print(p2_name);
                      if (p1_name.isNotEmpty) {
                        p1name = p1_name;
                      }
                      if (p2_name.isNotEmpty) {
                        p2name = p2_name;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Gamescreen(p1name, p2name)),
                      );
                    }
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
                        builder: (context) =>
                            Gamescreen('Player 1', 'Player 2'),
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
