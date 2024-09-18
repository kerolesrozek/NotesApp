import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addnotecubit/add_note_states.dart';
import 'package:notesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:notesapp/widgets/addnoteform.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Addnotecubit(),
      child: Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: BlocConsumer<Addnotecubit, NotesState>(
              listener: (context, state) {
            // TODO: implement listener
            if (state is AddNoteFailure) {
              print(state.errorMessage);
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          }, builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                child: AddNoteForm(),
              ),
            );
          })),
    );
  }
}
