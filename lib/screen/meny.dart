import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Function? onTap;

  const MenuItem({Key? key, this.icon, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xffFD8BAB),
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 26, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}