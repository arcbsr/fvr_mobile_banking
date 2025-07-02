import 'package:flutter_bloc/flutter_bloc.dart';
import 'privacy_event.dart';
import 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyBloc() : super(const PrivacyState()) {
    on<TogglePrivacyMode>((event, emit) {
      emit(state.copyWith(privacyMode: !state.privacyMode));
    });

    on<ToggleFingerprintUnlock>((event, emit) {
      emit(state.copyWith(fingerprintUnlock: !state.fingerprintUnlock));
    });

    on<ToggleAutoLock>((event, emit) {
      emit(state.copyWith(autoLock: !state.autoLock));
    });

    on<ToggleDarkMode>((event, emit) {
      emit(state.copyWith(darkMode: !state.darkMode));
    });
  }
}