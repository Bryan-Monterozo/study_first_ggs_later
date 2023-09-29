import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';

class StudyHome extends StatefulWidget {
  const StudyHome({super.key});

  @override
  State<StudyHome> createState() => _HomeState();
}

class _HomeState extends State<StudyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: appBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Homepage',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xFF1C1C1C),),
title: ClipRRect(
  borderRadius: BorderRadius.circular(8),
  child: Image.asset(
    'assets/images/Rectangle1.png',
    width: 115,
    height: 52,
    fit: BoxFit.fitHeight,
    alignment: Alignment(0.00, 0.00),
  ),
),
actions: [
  Container(
    width: 80,
    height: 80,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      'assets/images/Ellipse1.png',
      fit: BoxFit.cover,
      alignment: Alignment(0.00, -0.50),
    ),
  ),
],
centerTitle: true,
elevation: 0,
    );
  }
}
