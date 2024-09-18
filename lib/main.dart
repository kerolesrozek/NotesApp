import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:notesapp/consts.dart';
import 'package:notesapp/cubits/editnotecubit/edit_note_cubit.dart';
import 'package:notesapp/cubits/getnotescubit/getnotescubit_cubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/views/editnoteview.dart';
import 'package:notesapp/views/notesview.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
      NotemodelAdapter()); // note model adabter it exist in the adapter file that generated
  await Hive.openBox<Notemodel>(kNotesBox);
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetnotescubitCubit(),
        ),
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          EditNoteView.id: (context) {
            return EditNoteView();
          },
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: NoteView(),
      ),
    );
  }
}
