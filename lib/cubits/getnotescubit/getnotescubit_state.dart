part of 'getnotescubit_cubit.dart';

@immutable
sealed class GetnotescubitState {}

final class GetnotesInitialState extends GetnotescubitState {}
final class GetNotesSuccessState extends GetnotescubitState {
 final List<Notemodel>notes;

  GetNotesSuccessState({required this.notes});
}

final class GetNoteFailureSatte extends GetnotescubitState {
 final String errorMessage;

  GetNoteFailureSatte({required this.errorMessage});
}


