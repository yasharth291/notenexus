import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';



class SignUp extends StatelessWidget {


  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();

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
            image: DecorationImage(
                image: AssetImage("assets/logo2.png")
            ),
          ),
        ),

        SizedBox(
          height: 16,
        ),

        TextField(
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
            color: Color(0xFFF3D657),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF3D657).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child:  Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1C),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 24,
        ),

        Text(
          "Or Signin with",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFF3D657),
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

              icon: Icon(Entypo.google__with_circle,
                size: 32,
                color: Color(0xFFF3D657),),
              onPressed: () {
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
