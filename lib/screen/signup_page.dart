import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class signin extends StatefulWidget {
  @override
  final  emailHolder ;
  final  passHolder ;

  signin({
    Key key, @required this.emailHolder,
    this.passHolder,}) : super(key: key);
  signin_State createState() => signin_State(
    emailHolder : emailHolder,
    passHolder : passHolder,
  );
}

class signin_State extends State<signin>{
  final  emailHolder ;
  final  passHolder ;

  signin_State({
    Key key, @required this.emailHolder,
    this.passHolder,});
  String s,s1,s2,s3;
  bool _isloading= false;
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isButtonVisible: false ,
    isOverlayTapDismiss: true,
    animationDuration: Duration(milliseconds: 400),
    backgroundColor: Color(0xFFECCB95),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
      side: BorderSide(
        width: 4,
        color: Colors.black54,
      ),
    ),
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red,
    ),
  );
  signIn(String email, String password, String names,String college) async {
    String url = "https://notenexus.herokuapp.com/api/users/signup";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body  = json.encode({"email" : email, "password": password , "names" :names, "college":college});
    print(body);
    var jsonResponse;
    var res = await http.post(url, body: body,headers: {
      "Accept": "*/*",
      "Content-Type" : "application/json"
    },);
    try {
      if (res.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('email', email);
        print("*");
        jsonResponse = json.decode(res.body);
        print("Response Status: ${res.statusCode}");

        print("Response body: ${res.body}");

        if (jsonResponse != null) {
          setState(() {
            _isloading = false;
          });
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
                  (Route<dynamic> route) => false);
        }
      } else {
        print("2");
        setState(() {
          _isloading = false;
        });
        print("Response Status: ${res.statusCode}");
        print("Response body: ${res.body}");
        Alert(context: context, title: "Email Id Password Already present",style: alertStyle ).show();
      }
    }
    catch(e){
      print (e);
      Alert(context: context, title: "Something went Wrong Try Again ",style: alertStyle).show();
    }
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
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
                enabled:false,
                decoration: InputDecoration(
                  hintText: emailHolder,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
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
                  enabled: false,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: passHolder,
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
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
                  controller: nameController,
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
                  controller: collegeController,
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
                      setState(() {
                        _isloading = true;
                      });
                      signIn(emailHolder,passHolder,nameController.text,collegeController.text);
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

