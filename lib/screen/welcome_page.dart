import 'package:flutter/material.dart';
class Welcome_page extends StatefulWidget {
  @override
  Welcome_page_State createState() => Welcome_page_State();
}

class Welcome_page_State extends State<Welcome_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 450,
                width: 800,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/bg1.jpg"),
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