import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_add_deck.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/deck_tiles.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcMyDecks extends StatelessWidget {
  static const String routeName = '/reviewer/reviewer_fc_my_decks';
  ReviewerFcMyDecks({super.key});

  final ref = FirebaseFirestore.instance.collection('Decks');

  @override
  Widget build(BuildContext context) {
    debugPrint('Widget Rebuild');
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        titlePic: titlePic(context),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReviewerFcAddDeck()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 300,
                        crossAxisCount: 2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final fcDataMap = snapshot.data!.docs[index];
                          DeckModel deckModel = DeckModel.fromMap(
                              fcDataMap.data() as Map<String, dynamic>);
                          return DeckTileWidget(
                              deckModel: deckModel,
                              colorNotes: NoteColors().noteColorsList[index % 15]);
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
