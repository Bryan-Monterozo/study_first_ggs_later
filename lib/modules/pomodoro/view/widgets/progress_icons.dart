import 'package:flutter/material.dart';

class ProgressIcons extends StatelessWidget {
  final int total;
  final int done;

  const ProgressIcons({super.key, required this.total, required this.done});

  @override
  Widget build(BuildContext context) {
    final iconSize = 25.0;

    final doneIcon = Icon(
      Icons.check_box_sharp,
      color: Color(0xFF0B6BA7),
      size: iconSize,
    );

    final notDoneIcon = Icon(
      Icons.check_box_sharp,
      color: Color(0xFFCECECE),
      size: iconSize,
    );

    List<Icon> icons = [];

    for (int i = 0; i < total; i++) {
      if(i<done) {
        icons.add(doneIcon);
      }else{
        icons.add(notDoneIcon);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );
  }
}