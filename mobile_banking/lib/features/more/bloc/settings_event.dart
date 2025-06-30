import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class LogoutPressed extends SettingsEvent {}

/*
* My Account Page
*/
class MyAccountPressed extends SettingsEvent {}

class UpdatePersonalInfo extends SettingsEvent {
  final String name;
  final String fullName;
  final String dob;
  final String phone;
  final String email;
  final String address;

  UpdatePersonalInfo({required this.name, required this.fullName, required this.dob, required this.phone, required this.email, required this.address,});
}
/*
* My Account Page End
*/

/*
* Delete Account Page
*/
class DeleteAccountPressed extends SettingsEvent {}

class ConfirmDeleteAccount extends SettingsEvent {}
/*
* Delete Account Page End
*/