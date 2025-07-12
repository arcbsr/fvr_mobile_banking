/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_event.dart';
import '../bloc/settings/settings_state.dart';

class LanguageChangePage extends StatelessWidget {
  LanguageChangePage({super.key});

  final List<Map<String, dynamic>> languages = [
    {'code': 'en', 'name': 'English USA', 'flag': '🇺🇸'},
    {'code': 'ar', 'name': 'Arabic', 'flag': '🇩🇿'},
    {'code': 'fr', 'name': 'French', 'flag': '🇫🇷'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        */
/* if (state is BusinessAccountCreatedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('deleteAccountConfirmMsg'.tr())),
          );
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        } else if (state is BusinessAccountCreatedFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        }*//*

      },
      buildWhen: (previous, current) => true, // সব সময় rebuild হবে
      builder: (context, state) {
        print("check builder");
        return WillPopScope(
          onWillPop: () async {
            context.read<SettingsBloc>().add(
              LoadSettings(),
            ); // reset before pop
            return true; // allow pop
          },
          child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 20.h,
                  right: 20.w,
                  bottom: 20.h,
                ),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select Language", style: AppTextStyles.title),
                          SizedBox(height: 4),
                          Text(
                            "select from available language that you wish",
                            style: AppTextStyles.body.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //if (state is BusinessAccountEmpty)
                    ...languages.map(
                      (lang) =>
                          GestureDetector(
                        onTap: () {
                          print("LanguageSelected ${lang['code']}");
                          context.read<SettingsBloc>().add(
                            ChangeLanguage(lang['code']),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              //color: Colors.purple
                              color: (state is LanguageSelect && state.selectedLanguage == lang['code'])
                                        ? Colors.purple
                                        : Colors.grey.shade300
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                lang['flag'],
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  lang['name'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              if (state is LanguageSelect &&
                            state.selectedLanguage == lang['code'])
                               Text("${state.selectedLanguage} ... ${lang['code']} ",
                              ),
                             */
/* const Icon(
                                Icons.check_circle,
                                color: Colors.purple,
                              ),*//*

                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          context.read<SettingsBloc>().add(
                            CreatedBusinessAccount(),
                          );
                        },
                        child: Text(
                          "Save",
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
*/
