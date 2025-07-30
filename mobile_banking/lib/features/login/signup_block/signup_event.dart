import 'package:equatable/equatable.dart';
import 'package:moix_app/features/login/signup_block/signup_state.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFirstName extends SignupEvent {
  final String firstName;
  const UpdateFirstName(this.firstName);

  @override
  List<Object?> get props => [firstName];
}

class UpdateLastName extends SignupEvent {
  final String lastName;
  const UpdateLastName(this.lastName);

  @override
  List<Object?> get props => [lastName];
}

class UpdateUsername extends SignupEvent {
  final String username;
  const UpdateUsername(this.username);

  @override
  List<Object?> get props => [username];
}

class UpdateEmail extends SignupEvent {
  final String email;
  const UpdateEmail(this.email);

  @override
  List<Object?> get props => [email];
}

class UpdateGender extends SignupEvent {
  final String gender;
  const UpdateGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class UpdateReferralCode extends SignupEvent {
  final String code;
  const UpdateReferralCode(this.code);

  @override
  List<Object?> get props => [code];
}

class UpdateDob extends SignupEvent {
  final DateTime dob;
  const UpdateDob(this.dob);

  @override
  List<Object?> get props => [dob];
}

class CountrySelected extends SignupEvent {
  final String country;

  const CountrySelected(this.country);

  @override
  List<Object?> get props => [country];
}

class StateSelected extends SignupEvent {
  final String stateAddress;

  const StateSelected(this.stateAddress);

  @override
  List<Object?> get props => [stateAddress];
}

class UpdateStreetAddress extends SignupEvent {
  final String streetAddress;
  const UpdateStreetAddress(this.streetAddress);

  @override
  List<Object?> get props => [streetAddress];
}

class UpdateZipCode extends SignupEvent {
  final String zipCode;
  const UpdateZipCode(this.zipCode);

  @override
  List<Object?> get props => [zipCode];
}

class UpdatePassword extends SignupEvent {
  final String password;
  const UpdatePassword(this.password);

  @override
  List<Object?> get props => [password];
}

class UpdateConfirmPassword extends SignupEvent {
  final String confirmPassword;
  const UpdateConfirmPassword(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

class ToggleAgreement extends SignupEvent {}

class SelectTermsOption extends SignupEvent {
  final TermsOption option;

  SelectTermsOption(this.option);
}

class SignUpRequestSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String gender;
  final String first_name;
  final String last_name;
  final String user_name;
  final String account_type;
  final String country_id;
  final String state_id;
  final String? city_id; //
  final int day;
  final int month;
  final int year;
  final String? phone_number;//
  final String? ssn;//
  final String? store_name;//
  final String? referral_code;//

  SignUpRequestSubmitted({required this.email,required this.password, required this.gender,
    required this.first_name,required this.last_name, required this.user_name,
    required this.account_type,required this.country_id, required this.state_id,
    this.city_id,required this.day, required this.month,
    required this.year, this.phone_number, this.ssn,this.store_name, this.referral_code});
}

class GoToNextPage extends SignupEvent {}
class GoToPreviousPage extends SignupEvent {}

