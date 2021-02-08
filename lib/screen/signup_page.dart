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
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                height: MediaQuery.of(context).size.height - 728,
              ),
              CustomPaint(
                  painter: CurvePainter(true),
                  child: Container(
                    height: 80.0571,
                  )
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 150,
                    color: Color(0xFF1C1C1C),
                  ),
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                    Container(
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo2.png")),
                      ),
                    ),
                  ],
                  ),
                ],
              ),
            ],
      ),
      ),
    );
  }
}
class CurvePainter extends CustomPainter {

  bool outterCurve;

  CurvePainter(this.outterCurve);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFF1C1C1C);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height/2);
    path.quadraticBezierTo(size.width / 4, size.height/4 - 15, size.width/2, 0);
    path.quadraticBezierTo((size.width * 3)/ 4, size.height/4 - 15, size.width, size.height/2);
    path.lineTo( size.width,size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
