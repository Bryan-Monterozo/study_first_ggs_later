import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
// import 'package:flashcardplus/flashcardplus.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({super.key});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: const SharedAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(decoration: const BoxDecoration(color: Colors.white),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // MediaQuery.removePadding(
              //   context: context,
              //   removeBottom: true,
              //   child: AppBar(
              //     elevation: 0.0,
              //     backgroundColor: Colors.white54,
              //   ),
              // ),
              Expanded(
                flex: 4,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
                  color: Colors.white,
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    side: CardSide.FRONT,
                    speed: 500,
                    front: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('FRONT', style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                    back: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('BACK', style: TextStyle(color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ]
        ),
      );
  }
}


// child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 FlipCard(
//                   fill: Fill.fillBack,
//                   direction: FlipDirection.HORIZONTAL,
//                   side: CardSide.FRONT,
//                   speed: 500,
//                   front: Container(
//                     decoration: const BoxDecoration(color: Colors.red),
//                     child: Text("Front"),
//                   ),
//                   back: Container(
//                     decoration: const BoxDecoration(color: Colors.blue),
//                     child: Text("Back"),
//                   ),
//                 )
//               ]),