import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(selectedLanguage: 'en')) {
    on<LanguageSelected>((event, emit) {
      if (event.selectedLanguage != state.selectedLanguage) {
        emit(LanguageState(selectedLanguage: event.selectedLanguage));
      }
    });
  }
}