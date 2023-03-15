import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo/core/helper/auth_helper.dart';
import 'package:kardusinfo_todo/core/util/app_color.dart';
import 'package:kardusinfo_todo/data/model/note_model.dart';
import 'package:kardusinfo_todo/domain/usecase/create_note_usecase.dart';
import 'package:kardusinfo_todo/domain/usecase/get_all_notes_usecase.dart';

class NoteController extends GetxController {
  late AuthHelper _authHelper;
  late GetAllNotesUseCase _getAllNotesUseCase;
  late CreateNoteUseCase _createNoteUseCase;

  final _userEmail = ''.obs;
  String get userEmail => _userEmail.value;
  set userEmail(String value) => _userEmail.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  // today reminder
  final _todayReminder = <NoteModel>[].obs;
  List<NoteModel> get todayReminder => _todayReminder;
  set todayReminder(List<NoteModel> value) => _todayReminder.value = value;

  // all reminder
  final _allReminder = <NoteModel>[].obs;
  List<NoteModel> get allReminder => _allReminder;
  set allReminder(List<NoteModel> value) => _allReminder.value = value;

  @override
  void onInit() async {
    _authHelper = AuthHelper();
    _getAllNotesUseCase = Get.find();
    _createNoteUseCase = Get.find();
    isLoading = true;
    try {
      getUser();
      await getAllNotes();
    } finally {
      isLoading = false;
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUser() {
    var user = _authHelper.getUser();
    userEmail = user!.email!;
  }

  Future<void> getAllNotes() async {
    isLoading = true;
    try {
      var notes = await _getAllNotesUseCase.call();
      todayReminder = notes
          .where((element) =>
              DateTime.now().day == element.dateCreated?.day &&
              DateTime.now().month == element.dateCreated?.month &&
              DateTime.now().year == element.dateCreated?.year)
          .toList();
    } finally {
      isLoading = false;
    }
  }

  // add note
  Future<void> addNewNote() async {
    isLoading = true;
    try {
      var note = NoteModel(
        title: 'New Note',
        content: 'New Note Description',
        dateCreated: DateTime.now(),
        dateModified: DateTime.now(),
        color: AppColor.pastelPurple.value,
        isCompleted: false,
      );
      await _createNoteUseCase.call(note);
      await getAllNotes();
    } finally {
      isLoading = false;
    }
  }
}
