import 'package:flutter/material.dart';

Widget statsText(String playerStat, dynamic equipStat, double fSize) {
  return equipStat == null
      ? Text(
          playerStat,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        )
      : Text(
          '$playerStat + $equipStat',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        );
}
