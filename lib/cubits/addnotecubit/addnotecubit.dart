import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/consts.dart';
import 'package:notesapp/cubits/addnotecubit/add_note_states.dart';
import 'package:notesapp/models/notemodel.dart';

class Addnotecubit extends Cubit<NotesState> {
  Addnotecubit() : super(AddNoteIntial());
  Color color=Colors.orange;

  addNote(Notemodel notemodel) async {
    notemodel.color =color.value;
    emit(AddNoteLoading());

    try {
      var noteBox = Hive.box<Notemodel>(kNotesBox);
      await noteBox.add(notemodel);
      emit(
        AddNoteSuccess(),
      );
    } catch (e) {
      // TODO
      emit(
        AddNoteFailure(
          e.toString(),
        ),
      );
    }
  }
}
