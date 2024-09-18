import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/getnotescubit/getnotescubit_cubit.dart';
import 'package:notesapp/widgets/notewidget.dart';

class NotesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetnotescubitCubit, GetnotescubitState>(
      builder: (context, state) {
        if (state is GetNotesSuccessState) {
          return Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
            child: ListView.builder(
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  return NoteWidget(
                    note: state.notes[index],
                  );
                }),
          );
        } else {
          return Text(
            'there was an error',
            style: TextStyle(color: Colors.white, fontSize: 50),
          );
        }
      },
    );
  }
}
