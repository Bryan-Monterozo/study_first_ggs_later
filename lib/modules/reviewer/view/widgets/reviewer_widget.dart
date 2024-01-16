import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ReviewerWidget extends StatelessWidget {
  final String? reviewerText;
  final Color? reviewerColor;
  final String? reviewerPic;

  const ReviewerWidget({
    super.key,
    required this.reviewerText,
    required this.reviewerColor,
    required this.reviewerPic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(12),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: reviewerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.25, 1.25),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: kIsWeb
                            ? Image.network(
                                reviewerPic!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                reviewerPic!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(reviewerText!,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
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

class ReviewerGesture extends StatelessWidget {
  final Widget? revNavigator;
  final Widget? revContainer;

  const ReviewerGesture(
      {super.key, required this.revNavigator, this.revContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(revNavigator!,
        );
      },
      child: revContainer,
    );
  }
}
