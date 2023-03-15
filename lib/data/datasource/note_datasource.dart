import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kardusinfo_todo/core/helper/firestore_helper.dart';
import 'package:kardusinfo_todo/data/model/note_model.dart';

class NoteDataSource {
  final FirestoreHelper firebaseHelper;
  NoteDataSource(this.firebaseHelper);

  // get note collection
  Future<List<NoteModel>> get noteCollection async {
    var ref = await firebaseHelper.getCollection('notes').get();
    var listModel = ref.docs
        .map((e) => NoteModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return listModel;
  }

  // add new note
  Future<void> addNewNote(NoteModel note) async {
    await firebaseHelper.getCollection('notes').add(note.toJson());
  }
}
