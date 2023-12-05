import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Color? cardColor;
  final Color? backgroundColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final Widget? cardActionWidget;
  final Widget? userMoreInfo;

  const UserCard({super.key, 
    required this.cardColor,
    this.backgroundColor,
    this.cardRadius = 10,
    this.backgroundMotifColor = Colors.white,
    this.cardActionWidget,
    this.userMoreInfo,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mediaQueryHeight / 9,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius:
            BorderRadius.circular(double.parse(cardRadius!.toString())),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: (cardActionWidget != null)
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: (cardActionWidget != null)
                      ? cardActionWidget
                      : Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}