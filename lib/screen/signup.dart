import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notenexus/screen/Home.dart';
import '../main.dart';
import 'signup_page.dart';
import 'gsignup_page.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    signup(BuildContext context)async {
    Navigator.push(context,MaterialPageRoute(builder: (context)  => signin(
      emailHolder : emailController.text,
      passHolder : passwordController.text,
    ),));
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
      Navigator.push(context,MaterialPageRoute(builder: (context)  => gsignin(
        gmailHolder : _googleSignIn.currentUser.email,
        nameHolder : _googleSignIn.currentUser.displayName,
      ),));
    } catch (err){
      print(err);
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
            image: DecorationImage(image: AssetImage("assets/logo2.png")),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter Email',
            hintStyle: TextStyle(
              fontSize: 16,
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color:Colors.pink[100],
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink[100]!.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            // ignore: deprecated_member_use
            child: FlatButton(
              height: 40,
              color: Colors.pink[100]!.withOpacity(0.2),
              onPressed: () {
                signup(context);
                },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF363557),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Or Signup with",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.pink[100],
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 24,
            ),
            IconButton(
              icon: Icon(
                Entypo.google__with_circle,
                size: 32,
                color: Colors.pink[100],
              ),
              onPressed: () {
                print("hello");
                _login();

              },
              splashColor: Colors.orangeAccent,
            ),
          ],
        )
      ],
    );
  }
}
