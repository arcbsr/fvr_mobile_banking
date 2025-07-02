import 'package:flutter_bloc/flutter_bloc.dart';
import 'about_event.dart';
import 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(const AboutState()) {
    on<LoadAboutInfo>((event, emit) {
      emit(state.copyWith(loaded: true));
    });
  }
}