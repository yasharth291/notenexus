import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Color(0xFFECCB70), blurRadius: 30, offset: Offset(0, 10))
];

List<Map> drawerItems=[
  {
    'icon': FontAwesomeIcons.userAlt,
    'title' : 'Profile'
  },
  {
    'icon': Icons.mail,
    'title' : 'Donation'
  },
  {
    'icon': FontAwesomeIcons.plus,
    'title' : 'Add Notes'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
];
