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

  // get note by id
  Future<NoteModel> getNoteById(String id) async {
    var ref = await firebaseHelper
        .getCollection('notes')
        .where('id', isEqualTo: id)
        .get();
    var data = ref.docs.first.data() as Map<String, dynamic>;
    return NoteModel.fromJson(data);
  }

  // add new note
  Future<void> addNewNote(NoteModel note) async {
    await firebaseHelper.getCollection('notes').add(note.toJson());
  }

  // update note by id
  Future<void> updateNoteById(NoteModel note) async {
    var ref = await firebaseHelper
        .getCollection('notes')
        .where('id', isEqualTo: note.id)
        .get();
    var uid = ref.docs.first.id;
    firebaseHelper.updateDocumentById('notes', uid, note.toJson());
  }

  // delete note by id
  Future<void> deleteNoteById(String id) async {
    var ref = await firebaseHelper
        .getCollection('notes')
        .where('id', isEqualTo: id)
        .get();
    var uid = ref.docs.first.id;
    firebaseHelper.deleteDocumentById('notes', uid);
  }
}
