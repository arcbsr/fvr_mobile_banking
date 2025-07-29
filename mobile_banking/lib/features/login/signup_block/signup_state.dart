import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, success, failure }
enum TermsOption {
  none,
  notifyOnUpdates,
  notifyAboutUpdates,
}

class SignupState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String gender;
  final String referralCode;
  final DateTime? dob;
  final int currentPage;
  final String selectedCountry;
  final String selectedState;
  final String streetAddress;
  final String zipCode;
  final String password;
  final String confirmPassword;
  //final bool agreedToTerms;
  final TermsOption selectedTermsOption;

  const SignupState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.email = '',
    this.gender = '',
    this.referralCode = '',
    this.dob,
    this.currentPage = 0,
    this.selectedCountry = '',
    this.selectedState = '',
    this.streetAddress = '',
    this.zipCode = '',
    this.password = '',
    this.confirmPassword = '',
    //this.agreedToTerms = false,
    this.selectedTermsOption = TermsOption.none,
  });

  SignupState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? gender,
    String? referralCode,
    DateTime? dob,
    int? currentPage,
    String? selectedCountry,
    String? selectedState,
    String? streetAddress,
    String? zipCode,
    String? password,
    String? confirmPassword,
    bool? agreedToTerms,
    TermsOption? selectedTermsOption,
  }) {
    return SignupState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      referralCode: referralCode ?? this.referralCode,
      dob: dob ?? this.dob,
      currentPage: currentPage ?? this.currentPage,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      streetAddress: streetAddress ?? this.streetAddress,
      zipCode: zipCode ?? this.zipCode,
      password: streetAddress ?? this.password,
      confirmPassword: zipCode ?? this.confirmPassword,
      //agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      selectedTermsOption: selectedTermsOption ?? this.selectedTermsOption,
    );
  }

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    firstName,
    lastName,
    username,
    email,
    gender,
    referralCode,
    dob,
    currentPage,
    selectedCountry,
    selectedState,
    streetAddress,
    zipCode,
    password,
    confirmPassword,
    // agreedToTerms,
    selectedTermsOption
  ];
}
