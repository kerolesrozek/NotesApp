import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/consts.dart';
import 'package:notesapp/models/notemodel.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  editNote({required Notemodel note})async{
  emit(EditNoteLoeading());
    try {
  var noteBox = Hive.box<Notemodel>(kNotesBox);
    await noteBox.putAt(0,note);
    emit(
      EditNoteSuccess(),
    );
}  catch (e) {
  // TODO
  emit(EditNoteFailure());
}
  }
}
