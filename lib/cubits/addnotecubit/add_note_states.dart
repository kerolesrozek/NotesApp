class NotesState{}
class AddNoteIntial extends NotesState{}
class AddNoteLoading extends NotesState{}
class AddNoteSuccess extends NotesState{}
class AddNoteFailure extends NotesState{
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}