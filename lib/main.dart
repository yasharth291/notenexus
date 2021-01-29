import 'package:flutter/material.dart';
import 'screen/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notenexus',
      debugShowCheckedModeBanner: false,
      home: Welcome_page(),
    );
  }
}