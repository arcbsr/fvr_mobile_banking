import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/privacy/privacy_bloc.dart';
import '../bloc/privacy/privacy_event.dart';
import '../bloc/privacy/privacy_state.dart';
import '../../../core/theme/theme_cubit.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrivacyBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<PrivacyBloc, PrivacyState>(
          listener: (context, state) {
            // Optional: show snackbar on toggle
          },
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                Text('privacySecurity'.tr(), style: AppTextStyles.header.copyWith(color: Theme.of(context).textTheme.titleLarge?.color)),
                Text(
                  'privacySecuritySubTitle'.tr(),
                  style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
                SizedBox(height: 40.h),
                _sectionTitle(context, 'account'.tr()),
                _tileWithArrow(
                  context: context,
                  icon: Icons.lock_outline,
                  title: 'changeAccountPassword'.tr(),
                  onTap: () {
                    // Navigate to password screen
                  },
                ),
                _toggleTile(
                  context: context,
                  icon: Icons.remove_red_eye_outlined,
                  title: 'privacyMode'.tr(),
                  subtitle: 'privacyModeSubTitle'.tr(),
                  value: state.privacyMode,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(TogglePrivacyMode());
                  },
                ),
                 SizedBox(height: 40.h),
                _sectionTitle(context, 'lockScreen'.tr()),
                _tileWithArrow(
                  context: context,
                  icon: Icons.pin_outlined,
                  title: 'changeLockPIN'.tr(),
                  onTap: () {
                    // Navigate to pin screen
                  },
                ),
                _toggleTile(
                  context: context,
                  icon: Icons.fingerprint,
                  title: 'fingerprintUnlock'.tr(),
                  value: state.fingerprintUnlock,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(ToggleFingerprintUnlock());
                  },
                ),
                _toggleTile(
                  context: context,
                  icon: Icons.lock_clock,
                  title: 'autoLock'.tr(),
                  value: state.autoLock,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(ToggleAutoLock());
                  },
                ),
                 SizedBox(height: 40.h),
                _sectionTitle(context, 'appTheme'.tr()),
                _toggleTile(
                  context: context,
                  icon: Icons.dark_mode,
                  title: 'darkMode'.tr(),
                  value: context.watch<ThemeCubit>().state == ThemeMode.dark,
                  onChanged: (val) {
                    context.read<ThemeCubit>().setDarkMode(val);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.title.copyWith(color: Theme.of(context).textTheme.titleLarge?.color),
      ),
    );
  }

  Widget _tileWithArrow({
    required BuildContext context,
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _toggleTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color)),
      subtitle: subtitle != null ? Text(subtitle, style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodySmall?.color)) : null,
      activeColor: Theme.of(context).colorScheme.secondary,
      activeTrackColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
      inactiveThumbColor: Theme.of(context).disabledColor,
      inactiveTrackColor: Theme.of(context).disabledColor.withOpacity(0.2),
      value: value,
      onChanged: onChanged,
    );
  }
}
