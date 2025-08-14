import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/shared_preferences_helper.dart';
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
          final bool isKycVerified = getData.data?.isKycVerified != "0";
          await SharedPreferencesHelper().setUserId(getData.data?.userId);
          await SharedPreferencesHelper().setLoginCode(getData.data?.loginCode);
          emit(AuthSuccess(getData, isKycVerified));
        } else {
          emit(AuthFailure("Invalid credentials"));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<KycVerification>((event, emit) {
      if (state is AuthSuccess) {
        emit(KycVerificationStatus());
      }
    });
  }
}
