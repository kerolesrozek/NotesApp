import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/editnotecubit/edit_note_cubit.dart';
import 'package:notesapp/cubits/getnotescubit/getnotescubit_cubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/custombutton.dart';
import 'package:notesapp/widgets/customtextfield.dart';

class EditNoteForm extends StatefulWidget {
  EditNoteForm({
    super.key,
  });

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  String? titleE;

  String? contentE;

  GlobalKey<FormState> formkey2 = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    Notemodel notemodel =
        ModalRoute.of(context)!.settings.arguments as Notemodel;

    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is EditNoteLoeading ? true : false,
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formkey2,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                right: 16,
                left: 16,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    onSaved: (value) {
                      titleE = value;
                    },
                    hint: 'Title',
                    padding: EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      contentE = value;
                    },
                    hint: 'Content',
                    padding: EdgeInsets.symmetric(
                      vertical: 50,
                      horizontal: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    ButtonName: 'Update',
                    onTap: () {
                      if (formkey2.currentState!.validate()) {
                        formkey2.currentState!.save();
                        Notemodel note = Notemodel(
                            title: titleE!,
                            subtitle: contentE!,
                            date: notemodel.date,
                            color: notemodel.color);
                        BlocProvider.of<EditNoteCubit>(context)
                            .editNote(note: note);
                        Navigator.pop(context);
                        BlocProvider.of<GetnotescubitCubit>(context).getNotes();
                      }
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    },
                    isloading: state is EditNoteLoeading ? true : false,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
