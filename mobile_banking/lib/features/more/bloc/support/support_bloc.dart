import 'package:flutter_bloc/flutter_bloc.dart';
import 'support_event.dart';
import 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState()) {
    on<IssueSelected>((event, emit) {
      emit(state.copyWith(selectedIssue: event.issue));
    });

    on<DetailsChanged>((event, emit) {
      emit(state.copyWith(details: event.details));
    });

    on<SubmitSupportRequest>((event, emit) {
      // Here you can send to backend or print
      print("Issue: ${state.selectedIssue}, Details: ${state.details}");
      emit(state.copyWith(submitted: true));
    });
  }
}