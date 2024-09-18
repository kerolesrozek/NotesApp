import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/addnotecubit/add_note_states.dart';
import 'package:notesapp/cubits/addnotecubit/addnotecubit.dart';
import 'package:notesapp/cubits/getnotescubit/getnotescubit_cubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/colorslistviewwidget.dart';
import 'package:notesapp/widgets/custombutton.dart';
import 'package:notesapp/widgets/customtextfield.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subtitle;

  GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          CustomTextField(
            onSaved: (p0) {
              title = p0;
            },
            hint: 'Title',
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            onSaved: (p0) {
              subtitle = p0;
            },
            hint: 'Content',
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
          ),
          SizedBox(
            height: 15,
          ),
           ColorsListView(),
          SizedBox(
            height: 40,
          ),
         
          BlocBuilder<Addnotecubit, NotesState>(
            builder: (context, state) {
              return CustomButton(
                isloading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatted_date = DateFormat.yMd().format(currentDate);
                    BlocProvider.of<Addnotecubit>(context).addNote(Notemodel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatted_date,
                        color: BlocProvider.of<Addnotecubit>(context).color.value));
                    BlocProvider.of<GetnotescubitCubit>(context).getNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                ButtonName: 'Add',
              );
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
