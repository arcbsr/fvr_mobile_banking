import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_theme.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? _selectedLanguage;

  final List<Map<String, String>> languages = const [
    {'code': 'en', 'label': 'English', 'flag': '🇺🇸'},
    {'code': 'ar', 'label': 'Arabic', 'flag': '🇸🇦'},
    {'code': 'fr', 'label': 'French', 'flag': '🇫🇷'},
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage ??= context.locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('selectLanguage'.tr(), style: AppTextStyles.header.copyWith(color: Theme.of(context).textTheme.titleLarge?.color)),
              const SizedBox(height: 16),
              ...languages.map((lang) {
                final isSelected = _selectedLanguage == lang['code'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedLanguage = lang['code'];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.deepPurple.shade50 : Colors.white,
                      border: Border.all(
                        color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(lang['flag']!, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(lang['label']!, style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color)),
                        ),
                        if (isSelected)
                          Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
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
                onPressed: () async {
                  if (_selectedLanguage != null) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('selected_language', _selectedLanguage!);
                    Future.microtask(() {
                      context.setLocale(Locale(_selectedLanguage!));
                    });
                  }
                },
                child: Text('saveLanguage'.tr(), style: AppTextStyles.title.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
