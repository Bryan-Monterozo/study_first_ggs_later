import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeNavButtonWidget extends StatelessWidget {
  final String? navText;
  final String? navDesc;
  final Color navColor;
  final String? navPic;

  const HomeNavButtonWidget({
    super.key,
    this.navText,
    this.navDesc,
    required this.navColor,
    this.navPic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 24),
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          color: navColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: kIsWeb
                    ? Image.network(
                        navPic!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        navPic!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Text(navText!,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.00, 0.00),
                    child: Text(navDesc!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeNavGesture extends StatelessWidget {
  final Widget? navigator;
  final Widget? navContainer;

  const HomeNavGesture({super.key, required this.navigator, this.navContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
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
