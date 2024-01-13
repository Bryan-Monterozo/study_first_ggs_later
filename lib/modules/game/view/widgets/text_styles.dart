import 'package:flutter/material.dart';

Widget statsText(String playerStat, dynamic equipStat) {
  return equipStat == null
      ? Text(
          playerStat,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      : Text(
          '$playerStat + $equipStat',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        );
}
