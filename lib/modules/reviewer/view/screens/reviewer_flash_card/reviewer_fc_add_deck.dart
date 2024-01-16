import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcAddDeck extends StatefulWidget {
  static const String routeName = '/reviewer/reviewer_fc_add_deck';
  const ReviewerFcAddDeck({super.key});

  @override
  State<ReviewerFcAddDeck> createState() => _ReviewerAddDeckState();
}

class _ReviewerAddDeckState extends State<ReviewerFcAddDeck> {
  String deckName = '';
  String deckDesc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: '',
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.save_rounded),
            color: const Color(0xff1c1c1c),
            onPressed: () {
              ReviewerFcDB().addDeckToDB(
                deckName: deckName, 
                deckDesc: deckDesc,);
              Get.back();
            },
          ),
        ],
      ),
      body: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFF0B6BA7),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              )),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  maxLength: 30,
                  onChanged: (value) {
                    deckName = value;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterStyle: TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                      hintText: 'Deck Name'),
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                  maxLength: 60,
                  maxLines: 2,
                  onChanged: (value) {
                    deckDesc = value;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterStyle: TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                      hintText: 'Write a brief description...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
