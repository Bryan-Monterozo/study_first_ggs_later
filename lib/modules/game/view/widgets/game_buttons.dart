import 'package:flutter/material.dart';

Widget statsUpButton(Function upgrade, dynamic splash ,Color bgColor, Color iconColor) {
  return SizedBox(
    width: 30,
    height: 30,
    child: ClipOval(
      child: Material(
        color: bgColor, // button color
        child: InkWell(
          splashColor: splash,
          onTap: () {
            upgrade();
          },
          child: SizedBox(
            width: 15,
            height: 15,
            child: Icon(
              Icons.keyboard_double_arrow_up_sharp,
              color: iconColor,
            ),
          ),
        ),
      ),
    ),
  );
}
