import 'package:flutter/material.dart';

class HomeNavButtonWidget extends StatelessWidget {
  final Color? homeNavColor;
  final Color? homeNavColorText;
  final double? homeNavHeight;
  final double? homeNavWidth;
  final String? homeNavText;
  final Widget navContent;

  const HomeNavButtonWidget(
      {super.key,
      this.homeNavColor,
      this.homeNavColorText,
      this.homeNavHeight,
      this.homeNavWidth,
      this.homeNavText,
      required this.navContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: homeNavWidth,
      height: homeNavHeight,
      decoration: BoxDecoration(
        color: homeNavColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              homeNavText!,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: homeNavColorText!,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            navContent,
          ],
        ),
      ),
    );
  }
}

class HomeNavGetStarted extends StatelessWidget {
  final Color? homeNavColor;
  final Color? homeNavColorText;
  final double? homeNavHeight;
  final double? homeNavWidth;
  final String? homeNavText;

  const HomeNavGetStarted(
      {super.key,
      this.homeNavColor,
      this.homeNavColorText,
      this.homeNavHeight,
      this.homeNavWidth,
      this.homeNavText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: homeNavWidth,
      height: homeNavHeight,
      decoration: BoxDecoration(
        color: homeNavColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Text(
          homeNavText!,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: homeNavColorText!,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeNavGesture extends StatelessWidget {
  final Widget? navigator;
  final Widget? navContainer;

  const HomeNavGesture({
    super.key,
    this.navigator,
    this.navContainer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigator!,
          ),
        );
      },
      child: navContainer,
    );
  }
}
