import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class signin extends StatefulWidget {
  @override
  signin_State createState() => signin_State();
}

class signin_State extends State<signin> {
  String s,s1,s2,s3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECCB95),
      body: SingleChildScrollView(
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
        children : [
              Container(
                height: 300,
                width: 7000,
                child:   FittedBox(
                    child: Image.asset('background.png'),
                    fit: BoxFit.fill
                  ),
              ),
              Column(children: [
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 100,
                  width: 1500,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/logo2.png")),
                  ),
                ),
              ],
              ),
        ],),
              Container(
              width: 340,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.black87.withOpacity(0.9),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                ),
              ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 340,
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black87.withOpacity(0.9),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Container(
                width: 340,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black87.withOpacity(0.9),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 340,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'College',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.black87.withOpacity(0.9),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1C1C1C).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: FlatButton(
                    height: 40,
                    color: Color(0xFF1C1C1C).withOpacity(0.2),
                    onPressed: () {
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFECCB95),
                      ),
                    ),
                  ),
                ),
              ),

            ],

      ),
      ),
    );
  }
}

