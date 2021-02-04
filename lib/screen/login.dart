import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class  Login extends StatefulWidget {
  @override
  Login_State createState() => Login_State();
}

class Login_State extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  createAlbum(Map<String, dynamic> body)async{
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(body);
      var response = await dio.post("https://notenexus.herokuapp.com/api/users/login", data: formData);
      return response.data;
    } catch (e) {
      print(e);
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
          decoration: InputDecoration(
            hintText: 'E - mail',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFFD9BC43),
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
            fillColor: Color(0xFFECCB45),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: passController,
          obscuringCharacter: "*",
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xFFD9BC43),
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
            fillColor: Color(0xFFECCB45),
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
                  var map = new Map<String, dynamic>();
                  map['email'] = emailController.text;
                  map['password'] = passController.text;
                  createAlbum(map);
                });
              },
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF3D657),
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
