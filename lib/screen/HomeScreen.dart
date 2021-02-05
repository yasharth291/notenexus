import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset , 0)..scale(scaleFactor)..rotateY(isDrawerOpen?-0.2:0),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xFFECCB70), blurRadius: 40, offset: Offset(0, 10)),
        ],
        color : Color(0xFFECCB70),
        borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0),
      )
      ,
       child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Center(
                child : Container(
                  height: 160,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/logo.png")),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Align(
               alignment: Alignment(0 , -0.9),
                child : ClipPath(
                  clipper: CustomMenuClipper(),
                 child : Container(
                  width: 35,
                  height: 110,
                  color: Color(0xFF1C1C1C),
                  child : isDrawerOpen ?
                  IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,
                    onPressed: (){
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    },
                  )
                  : IconButton(icon: Icon(Icons.menu, color: Colors.white), onPressed: (){
                    setState(() {
                      xOffset = 200;
                      yOffset = 150;
                      scaleFactor = 0.6;
                      isDrawerOpen = true;
                    });
              }),

              ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ],
          )
            ],
      ),

    );
  }
}

class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Paint paint = Paint();
    paint.color = Color(0xFFECCB70);

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