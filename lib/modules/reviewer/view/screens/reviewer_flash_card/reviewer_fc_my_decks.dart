import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:study_first_ggs_later/core/constants/reviwer_notes_colors.dart';
import 'package:study_first_ggs_later/modules/reviewer/models/fc_model.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_flash_card/reviewer_fc_add_deck.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/deck_tiles.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/widgets/search_bar.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';

class ReviewerFcMyDecks extends StatelessWidget {
  static const String routeName = '/reviewer/reviewer_fc_my_decks';
  const ReviewerFcMyDecks({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final ref = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Decks');
    debugPrint('Widget Rebuild');
    return Scaffold(
      appBar: SharedAppBar(
        leading: leadingBack(context),
        title: 'Flash Cards',
        withPic: withPic(context),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: const Color(0xFF0B6BA7),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewerFcAddDeck()));
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return MasonryGridView.builder(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final fcDataMap = snapshot.data!.docs[index];
                          DeckModel deckModel = DeckModel.fromMap(
                              fcDataMap.data() as Map<String, dynamic>);
                          return DeckTileWidget(
                              deckModel: deckModel,
                              colorNotes:
                                  NoteColors().noteColorsList[index % 15]);
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
