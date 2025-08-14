import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneLoginSubmitted extends AuthEvent {
  final String? phone;
  final String? email;
  final String password;

  PhoneLoginSubmitted({this.phone,this.email, required this.password});
}
class KycVerification extends AuthEvent {}

/*
class EmailLoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  EmailLoginSubmitted({required this.email, required this.password});
}*/
