import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/language/language_bloc.dart';
import '../bloc/language/language_event.dart';
import '../bloc/language/language_state.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  final List<Map<String, String>> languages = const [
    {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
    {'code': 'ar', 'label': 'Arabic', 'flag': '🇸🇦'},
    {'code': 'fr', 'label': 'French', 'flag': '🇫🇷'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageBloc(),
      child: BlocListener<LanguageBloc, LanguageState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // title: Text('businessAccount'.tr()),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 20.h,
                right: 20.w,
                bottom: 20.h,
              ),
              child: BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('selectLanguage'.tr(), style: AppTextStyles.title),
                      const SizedBox(height: 16),
                      ...languages.map((lang) {
                        final isSelected =
                            state.selectedLanguage == lang['code'];
                        return GestureDetector(
                          onTap: () {
                            context.read<LanguageBloc>().add(
                              LanguageSelected(lang['code']!),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.deepPurple.shade50
                                  : Colors.white,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  lang['flag']!,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    lang['label']!,
                                    style: AppTextStyles.body,
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.deepPurple,
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          final selected = context
                              .read<LanguageBloc>()
                              .state
                              .selectedLanguage;
                          if (Locale(selected) != null) {
                            Future.microtask(() {
                              context.setLocale(Locale(selected));
                            });
                           // context.setLocale(Locale(selected));
                          }

                          /*ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Selected language: $selected"),
                            ),
                          );*/
                        },
                        child: Text('saveLanguage'.tr(),style: AppTextStyles.title.copyWith(color: Colors.white)),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
