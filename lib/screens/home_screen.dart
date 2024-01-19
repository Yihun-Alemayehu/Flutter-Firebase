import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_1/screens/addNotes_screen.dart';
import 'package:flutter_firebase_1/services/firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreServices firestoreServices = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getNotes(), // Changed to use StreamBuilder
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Convert snapshot data to a list of notes
            List notesList = snapshot.data!.docs;
            // Return a ListView of notes
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                //get each individual doc
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                //get note from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;

                String noteText = data['note'];
                return ListTile(
                    // leading: ,
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddNotesScreen(docID: docID),
                                ));
                          },
                          icon: const Icon(
                            Icons.edit_note,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              firestoreServices.deleteNotes(docID);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    )
                    // subtitle: Text(notesList[index]['note']),
                    );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNotesScreen(); // Added unique key to properly rebuild the screen
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
