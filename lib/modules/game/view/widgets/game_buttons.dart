import 'package:flutter/material.dart';

Widget statsUpButton(Function upgrade, dynamic splash ,Color bgColor, Color iconColor) {
  return SizedBox(
    width: 40,
    height: 40,
    child: ClipOval(
      child: Material(
        color: bgColor, // button color
        child: InkWell(
          splashColor: splash,
          onTap: () {
            upgrade();
          },
          child: SizedBox(
            width: 20,
            height: 20,
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
