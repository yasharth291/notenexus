import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset , 0)..scale(scaleFactor)..rotateY(isDrawerOpen?-0.2:0),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xFFECCB95), blurRadius: 20, offset: Offset(0, 10)),
        ],
        color :   Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0),
      )
      ,
       child: Stack(
            children: [
              Transform.rotate(
                origin: Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors : [Color(0xffFD8BAB), Color(0xFFFD44C4)],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                SizedBox(
                height: 10,
          ),
      ],
          ),
            ],
      ),

    ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Paint paint = Paint();
    paint.color = Color(0xFFECCB95);

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1 , height/2 - 20, width,height/2);
    path.quadraticBezierTo(width + 1,height/2 + 20, 10, height - 16);
    path.quadraticBezierTo(0,height - 8,0,height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)
  {
    return true;
  }
}
