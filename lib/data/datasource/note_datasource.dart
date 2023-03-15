import 'package:kardusinfo_todo/core/helper/firestore_helper.dart';
import 'package:kardusinfo_todo/data/model/note_model.dart';

class NoteDataSource {
  final FirestoreHelper firebaseHelper;
  NoteDataSource(this.firebaseHelper);

  // get note collection
  Future<List<NoteModel>> get noteCollection async {
    var ref = await firebaseHelper.getCollection('notes').get();
    var listModel = ref.docs.map((e) {
      var data = e.data() as Map<String, dynamic>;
      return NoteModel.fromJson(data);
    }).toList();
    return listModel;
  }

  // add new note
  Future<void> addNewNote(NoteModel note) async {
    await firebaseHelper.getCollection('notes').add(note.toJson());
  }

  // update note by id
  Future<void> updateNoteById(String id, NoteModel note) async {
    await firebaseHelper.getCollection('notes').doc(id).update(note.toJson());
  }
}
