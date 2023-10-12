import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeNavButtonWidget extends StatelessWidget {
  final String? navText;
  final String? navDesc;
  final Color? navColor;
  final String? navPic;

  const HomeNavButtonWidget({
    super.key,
    this.navText,
    this.navDesc,
    this.navColor,
    this.navPic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 6, 24, 6),
      child: Container(
        width: 400,
        height: 150,
        decoration: BoxDecoration(
          color: navColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Text(navText!,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: Text(navDesc!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: kIsWeb ? Image.network(
                  navPic!,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                )
                : Image.asset(
                  navPic!,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                )
                ,
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
