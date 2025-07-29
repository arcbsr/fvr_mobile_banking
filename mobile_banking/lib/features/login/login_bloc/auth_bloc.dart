import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_api/auth_api_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiRepository authApiRepository;

  AuthBloc({required this.authApiRepository}) : super(AuthInitial()) {
    on<PhoneLoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        Map<String, String> data = {
          'email': ?event.email,
          'password': event.password,
        };
        final getData = await authApiRepository.loginApi(data);
        if (getData.status == true) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure("Invalid credentials"));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
