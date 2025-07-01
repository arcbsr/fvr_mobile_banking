import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/repositories/demo_home_repository.dart';
import '../../model/settings_item.dart';
import 'settings_event.dart';
import 'settings_state.dart';
import 'package:flutter/material.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<LoadSettings>((event, emit) async {
      final user = await DemoHomeRepository().getUser();
      final items = [
        SettingsItem(title: 'generalSettings'.tr(), isSectionTitle: true),
        SettingsItem(icon: Icons.person_outline, title: 'myAccount'.tr()),
        SettingsItem(icon: Icons.business_center_outlined, title: 'openBusinessAccount'.tr()),
        SettingsItem(title: 'helpAndSettings'.tr(), isSectionTitle: true),
        SettingsItem(icon: Icons.language, title: 'changeLanguage'.tr()),
        SettingsItem(icon: Icons.lock_outline, title: 'privacySecurity'.tr()),
        SettingsItem(icon: Icons.support_agent, title: 'contactSupport'.tr()),
        SettingsItem(icon: Icons.send_outlined, title: 'sendFeedback'.tr()),
        SettingsItem(icon: Icons.info_outline, title: 'aboutMobix'.tr()),
        SettingsItem(icon: Icons.delete_outline, title: 'deleteAccount'.tr()),
      ];
      emit(SettingsLoaded(items, user));
    });

   /* on<MyAccountPressed>((event, emit) {
      emit(MyAccountState());
    });*/
////////////////////////////////////////////////////////////////////////////////
    on<MyAccountLoad>((event, emit) {
      if (state is SettingsLoaded) {
        final user = (state as SettingsLoaded).user;
        emit(MyAccountState(user));
      }
    });

    on<UpdatePersonalInfo>((event, emit) async {
      emit(UpdatingPersonalInfo());
      try {
        // Need API Call here
        /*await repo.updateProfileInfo(
          username: event.username,
          fullName: event.fullName,
          dob: event.dob,
          phone: event.phone,
          email: event.email,
          address: event.address,
        );*/
        await Future.delayed(Duration(seconds: 2)); // Simulate delete API
        emit(UpdatePersonalInfoSuccess());
        // emit(LoadSettings()); // Refresh
      } catch (e) {
        emit(UpdatePersonalInfoFailed("Update failed!"));
      }
    });


////////////////////////////////////////////////////////////////////////////////
    on<BusinessAccountLoad>((event, emit) {
      emit(BusinessAccountState());
    });
   /* on<BusinessAccountLoad>((event, emit) async {
      emit(BusinessAccountState());
      //await Future.delayed(Duration(seconds: 1)); // simulate API delay
     // emit(BusinessAccountEmpty()); // no account found
    });*/

    on<CreatedBusinessAccount>((event, emit) async {
      emit(CreatingBusinessAccount());
      await Future.delayed(Duration(seconds: 2)); // Simulate delete API
   /*   emit(BusinessAccountLoaded("Mobix Traders Ltd"));
      await Future.delayed(Duration(seconds: 2));*/
      emit(BusinessAccountCreatedSuccess());
    });

////////////////////////////////////////////////////////////////////////////////
/*    on<LanguageChangeLoad>((event, emit) {
      emit(ChangeLanguageState());
      emit(LanguageSelect(selectedLanguage: 'en'));
    *//*  if (state is LanguageSelect) {
        emit(LanguageSelect(selectedLanguage: event.languageCode));
      }*//*
    });

   on<ChangeLanguage>((event, emit) {
     if (state is LanguageSelect) {
       print("ChangeLanguage");
       emit((state as LanguageSelect).copyWith(selectedLanguage: event.languageCode));
     }
     // emit(LanguageSelect(selectedLanguage: event.languageCode));
    });

  *//*  on<LanguageSelected>((event, emit) {
      emit(state.copyWith(selectedLanguageCode: event.languageCode));
    });*//*

    on<SavedSelectedLanguage>((event, emit) async {
      emit(SaveLanguage());
    });
////////////////////////////////////////////////////////////////////////////////
*/
    on<DeleteAccountLoad>((event, emit) {
      emit(DeleteAccountState());
    });

    on<ConfirmDeleteAccount>((event, emit) async {
      emit(DeletingAccount());
      await Future.delayed(Duration(seconds: 2)); // Simulate delete API
      emit(DeleteSuccess());
    });
  }
}