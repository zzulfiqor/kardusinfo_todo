import 'package:get/get.dart';
import 'package:kardusinfo_todo/domain/usecase/create_note_usecase.dart';

import '../../../../domain/usecase/get_all_notes_usecase.dart';
import '../controller/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(() => NoteController());

    // Usecases
    Get.lazyPut<GetAllNotesUseCase>(() => GetAllNotesUseCase(Get.find()));
    Get.lazyPut<CreateNoteUseCase>(() => CreateNoteUseCase(Get.find()));
  }
}
