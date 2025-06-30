import 'package:equatable/equatable.dart';
import 'package:moix_app/features/home/domain/entities/user_entity.dart';
import '../model/settings_item.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final List<SettingsItem> items;
  final User user;

  const SettingsLoaded(this.items,this.user);

  @override
  List<Object?> get props => [items];
}

/*
* My Account Page
*/
class MyAccountState extends SettingsState {
  final User user;
  const MyAccountState(this.user);
}

class UpdatingPersonalInfo extends SettingsState {}

class UpdatePersonalInfoSuccess extends SettingsState {}

class UpdatePersonalInfoFailed extends SettingsState {
  final String message;

  const UpdatePersonalInfoFailed(this.message);

  @override
  List<Object?> get props => [message];
}
/*
* My Account Page End
*/

/*
* Delete Account Page
*/
class DeleteAccountState extends SettingsState {}

class DeletingAccount extends SettingsState {}

class DeleteSuccess extends SettingsState {}

class DeleteFailed extends SettingsState {
  final String message;

  const DeleteFailed(this.message);

  @override
  List<Object?> get props => [message];
}
/*
* Delete Account Page End
*/