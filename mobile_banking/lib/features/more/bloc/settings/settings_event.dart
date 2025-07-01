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
class MyAccountLoad extends SettingsEvent {}

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
* Business Account Page
*/
class BusinessAccountLoad extends SettingsEvent {}

class CreatedBusinessAccount extends SettingsEvent {}
/*
* Business Account Page End
*/

/*
* Language Account Page
*//*
class LanguageChangeLoad extends SettingsEvent {}

class ChangeLanguage extends SettingsEvent {
  final String languageCode;

  const ChangeLanguage(this.languageCode);
}

class SavedSelectedLanguage extends SettingsEvent {}
*//*
* Language Page End
*/

/*
* Delete Account Page
*/
class DeleteAccountLoad extends SettingsEvent {}

class ConfirmDeleteAccount extends SettingsEvent {}
/*
* Delete Account Page End
*/