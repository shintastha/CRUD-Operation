import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  // CREATE : add a new notes
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();

    return notesStream;
  }

  // UPDATE: update notes give a doc id
  Future<void> updataNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete notes given a doc id
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
    
  }
}
