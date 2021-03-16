import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'drawerScreen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends  State<Home>{
  String? email ="";
  Future getEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.get('email');
    });


  }
  @override
  void initState(){
    super.initState();
    getEmail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      body: Stack(
        children: [
          HomeScreen(),
          SideBar(),
        ],
      ),
    );
  }
}


