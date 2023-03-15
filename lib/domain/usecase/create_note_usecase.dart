import 'package:kardusinfo_todo/core/helper/base_usecase.dart';
import 'package:kardusinfo_todo/data/model/note_model.dart';

import '../repository/note_repository.dart';

class CreateNoteUseCase extends UseCase<void, NoteModel> {
  final NoteRepository repository;
  CreateNoteUseCase(this.repository);

  @override
  Future<void> call(NoteModel param) async {
    return await repository.insertNote(param);
  }
}