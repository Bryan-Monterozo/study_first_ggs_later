import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/controller/loading_controller.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GameWidget(game: LoadingSprite()),
    );
  }
}

class LoadingAnimationTransparent extends StatelessWidget {
  const LoadingAnimationTransparent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GameWidget(game: LoadingSpriteTrans()),
    );
  }
}