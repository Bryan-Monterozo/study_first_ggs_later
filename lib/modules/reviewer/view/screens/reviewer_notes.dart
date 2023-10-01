import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_first_ggs_later/modules/shared/app_bar.dart';
import 'package:study_first_ggs_later/modules/shared/nav_bar.dart';
import 'package:study_first_ggs_later/modules/reviewer/view/screens/reviewer_add_notes.dart';

class ReviewerNotes extends StatelessWidget {
  ReviewerNotes({super.key});

  final ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SharedAppBar(
          titlePic: titlePic(context),
          withPic: withPic(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewerAddNote()));
          },
        ),
        drawer: const NavDrawer(),
        body: SafeArea(
            child: StreamBuilder(
                stream: ref.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(20),
                            height: 150,
                            color: Colors.grey,
                            child: Column(
                              children: [
                                Text(snapshot.data!.docs[index]['title']),
                                Text(snapshot.data!.docs[index]['content']),
                              ],
                            )
                            );
                      });
                })));
  }
}
