import 'package:flutter/material.dart';

class FlashCardButtonWidget extends StatelessWidget {
  final String? flashCardButtonText;
  final Color? flashCardButtonColor;
  final IconData? flashCardButtonIcon;

  const FlashCardButtonWidget({
    super.key,
    required this.flashCardButtonText,
    required this.flashCardButtonColor,
    required this.flashCardButtonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: flashCardButtonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              flashCardButtonIcon,
              color: Colors.white,
              size: 14,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(flashCardButtonText!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashCardButtonGesture extends StatelessWidget {
  final Widget? flashCardButtonNavigator;
  final Widget flashCardButtonContainer;

  const FlashCardButtonGesture(
      {super.key, this.flashCardButtonNavigator,  required this.flashCardButtonContainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: flashCardButtonNavigator != null
      ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => flashCardButtonNavigator!,
          ),
        );
      }
      : () => Navigator.pop(context),
      child: flashCardButtonContainer,
    );
  }
}
