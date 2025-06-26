import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('languageSettings'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('selectLanguage'.tr(), style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            DropdownButton<Locale>(
              value: context.locale,
              items: [
                DropdownMenuItem(child: Text('english'.tr()), value: const Locale('en')),
                DropdownMenuItem(child: Text('french'.tr()), value: const Locale('fr')),
              ],
              onChanged: (Locale? locale) {
                if (locale != null) {
                  context.setLocale(locale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
} 