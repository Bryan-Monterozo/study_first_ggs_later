import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/modules/reviewer/services/reviewer_fc_collection.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcAddDeck extends StatefulWidget {
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
        title: 'Create a Deck',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              ReviewerFcDB().addDeckToDB(
                deckName: deckName, 
                deckDesc: deckDesc,);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 60,
                onChanged: (value) {
                  deckName = value;
                },
                decoration: const InputDecoration(hintText: 'Deck Name'),
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                maxLength: 60,
                onChanged: (value) {
                  deckDesc = value;
                },
                decoration: const InputDecoration(hintText: 'Description'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}