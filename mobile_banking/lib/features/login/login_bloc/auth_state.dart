import '../model/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

/*class AuthSuccess extends AuthState {
  final UserModel? user;
  AuthSuccess(this.user);
}*/

class AuthSuccess extends AuthState {
  final UserModel user;
  final bool kycVerified;

  AuthSuccess(this.user, this.kycVerified);

  @override
  List<Object?> get props => [user, kycVerified];
}

class KycVerificationStatus extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
