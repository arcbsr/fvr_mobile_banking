import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_api/auth_api_repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthApiRepository authApiRepository;

  SignupBloc({required this.authApiRepository}) : super(const SignupState()) {
    on<UpdateFirstName>(
      (e, emit) => emit(state.copyWith(firstName: e.firstName)),
    );
    on<UpdateLastName>((e, emit) => emit(state.copyWith(lastName: e.lastName)));
    on<UpdateUsername>((e, emit) => emit(state.copyWith(username: e.username)));
    on<UpdateEmail>((e, emit) => emit(state.copyWith(email: e.email)));
    on<UpdateGender>((e, emit) => emit(state.copyWith(gender: e.gender)));
    on<UpdateReferralCode>(
      (e, emit) => emit(state.copyWith(referralCode: e.code)),
    );
    on<UpdateDob>((e, emit) => emit(state.copyWith(dob: e.dob)));
    on<CountrySelected>(
      (e, emit) => emit(state.copyWith(selectedCountry: e.country)),
    );
    on<StateSelected>(
      (e, emit) => emit(state.copyWith(selectedState: e.stateAddress)),
    );
    on<UpdateStreetAddress>(
      (e, emit) => emit(state.copyWith(streetAddress: e.streetAddress)),
    );
    on<UpdateZipCode>((e, emit) => emit(state.copyWith(zipCode: e.zipCode)));
    on<UpdatePassword>((e, emit) => emit(state.copyWith(password: e.password)));
    on<UpdateConfirmPassword>(
      (e, emit) => emit(state.copyWith(confirmPassword: e.confirmPassword)),
    );

  /*  on<ToggleAgreement>((event, emit) {
      emit(state.copyWith(agreedToTerms: !state.agreedToTerms));
    });*/

    on<SelectTermsOption>((event, emit) {
      emit(state.copyWith(selectedTermsOption: event.option));
    });

    on<GoToNextPage>(
      (e, emit) => emit(state.copyWith(currentPage: state.currentPage + 1)),
    );
    on<GoToPreviousPage>(
      (e, emit) => emit(state.copyWith(currentPage: state.currentPage - 1)),
    );

    on<SignUpRequestSubmitted>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        Map<String, String> data = {
          'email': event.email,
          'gender': event.gender,
          'first_name': event.first_name,
          'last_name': event.last_name,
          'user_name': event.user_name,
          'account_type': event.account_type,
          'country_id': event.country_id,
          'state_id': event.state_id,
          'day': event.day.toString(),
          'month': event.month.toString(),
          'year': event.year.toString()
        };

        print("data object $data");
        /*final getData = await authApiRepository.signUpApi(data);
        if (getData.status == true) {
          emit(state.copyWith(status: AuthStatus.success));
        } else {
          emit(
            state.copyWith(
              status: AuthStatus.failure,
              errorMessage: "Invalid credentials",
            ),
          );
        }*/
      } catch (e) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
