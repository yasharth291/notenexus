import 'package:flutter/material.dart';
import 'package:notenexus/config/drawerConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notenexus/main.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  Future logout(BuildContext context)async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 0, left: 10),
      color: Color(0xFF303030),
      child: Column(
        children : [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              maxRadius: 40,
              backgroundColor: Color(0xFFECCB70),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                'Username',
                style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
              Text(
                'College name',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
              ),
              ),
            ],
            ),
          ],
      ),
          SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(element['icon'],
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    element['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              ),
            ),
            ).toList(),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              Icon(Icons.settings,color: Colors.white,size: 20,),
              SizedBox(width: 10),
              Text(
                'Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 2,
                height: 20,
                color: Colors.white
              ),
              SizedBox(width: 0),
              FlatButton(
                child : Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (){
                  logout(context);
                },
                textColor: Colors.white,
                color: Colors.transparent,
              ),
            ],
          ),
      ],
      ),
    );
  }
}

