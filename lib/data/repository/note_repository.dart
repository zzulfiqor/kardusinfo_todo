import 'dart:developer';

import 'package:kardusinfo_todo/data/datasource/note_datasource.dart';
import 'package:kardusinfo_todo/data/model/note_model.dart';
import 'package:kardusinfo_todo/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource ds;
  NoteRepositoryImpl(this.ds);

  @override
  Future<void> deleteNoteById(String id) {
    return ds.deleteNoteById(id);
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    var snapshot = await ds.noteCollection;
    return snapshot;
  }

  @override
  Future<NoteModel> getNoteById(String id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(NoteModel note) {
    return ds.addNewNote(note);
  }

  @override
  Future<void> updateNote(NoteModel note)async {
    return await ds.updateNoteById(note);
  }


}
