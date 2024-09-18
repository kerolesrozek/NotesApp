import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/consts.dart';
import 'package:notesapp/models/notemodel.dart';

part 'getnotescubit_state.dart';

class GetnotescubitCubit extends Cubit<GetnotescubitState> {
  GetnotescubitCubit() : super(GetnotesInitialState());

  

   getNotes() {
    try {
  var box = Hive.box<Notemodel>(kNotesBox);
  List<Notemodel> notes = box.values.toList();
  emit(GetNotesSuccessState(notes: notes));
}  catch (e) {
  // TODO
  emit(GetNoteFailureSatte(errorMessage: e.toString()));
}
    
  }
}
