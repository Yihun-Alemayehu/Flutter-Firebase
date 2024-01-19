import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  // get collection of firestore services
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //Create:
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //Read:
  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  //Update:
  Future<void> updateNotes(String docID, String newNotes) {
    return notes.doc(docID).update({
      'note': newNotes,
      'timestamp': Timestamp.now(),
    });
  }

  //Delete:
  Future<void> deleteNotes(String docID) {
    return notes.doc(docID).delete();
  }
}
