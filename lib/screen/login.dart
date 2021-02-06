import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class  Login extends StatefulWidget {
  @override
  Login_State createState() => Login_State();
}

class Login_State extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String s = "",s2 = "";
  bool _isloading = false;
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
  signIn(String email, String password) async {
    String url = "https://notenexus.herokuapp.com/api/users/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var body  = json.encode({"email" : email, "password": password});
    print(body);
    var jsonResponse;
    var res = await http.post(url, body: body,headers: {
    "Accept": "*/*",
      "Content-Type" : "application/json"
    },);
    try {
      if (res.statusCode == 200) {
        print("*");
        jsonResponse = json.decode(res.body);
        print("Response Status: ${res.statusCode}");

        print("Response body: ${res.body}");

        if (jsonResponse != null) {
          setState(() {
            _isloading = false;
          });
          sharedPreferences.setString("token", jsonResponse['token']);

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
        Alert(context: context, title: "Incorrect Email ID or Password",style: alertStyle ).show();
      }
    }
    catch(e){
      print (e);
      Alert(context: context, title: "Something went Wrong Try Again ",style: alertStyle).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 110,
          width: 1500,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo.png")),
          ),
        ),
        SizedBox(
          height: 26,
        ),
        TextField(
          controller: emailController,
          onChanged: (String text){
            s2 = text;
          },
          decoration: InputDecoration(
            hintText: 'E - mail',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.black,
                width: 20,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color(0xFFECCB95),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          onChanged: (String text){
            s = text;
          },
          obscuringCharacter: "*",
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.black,
                width: 400,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color(0xFFECCB95),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
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
                  print(s2);
                  print(s);
                    signIn(s2, s);
                    },
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFECCB95),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C1C1C),
            height: 1,
          ),
        ),
      ],
    );
  }


}
