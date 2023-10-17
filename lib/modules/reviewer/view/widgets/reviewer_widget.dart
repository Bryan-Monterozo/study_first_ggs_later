import 'package:flutter/material.dart';

class ReviewerWidget extends StatelessWidget {
  final String? reviewerText;
  final Color? reviewerColor;
  final IconData? reviewerIcon;

  const ReviewerWidget({
    super.key,
    required this.reviewerText,
    required this.reviewerColor,
    required this.reviewerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: reviewerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              reviewerIcon,
              color: Colors.white,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(reviewerText!,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewerGesture extends StatelessWidget {
  final Widget? revNavigator;
  final Widget? revContainer;

  const ReviewerGesture(
      {super.key, required this.revNavigator, this.revContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => revNavigator!,
          ),
        );
      },
      child: revContainer,
    );
  }
}
