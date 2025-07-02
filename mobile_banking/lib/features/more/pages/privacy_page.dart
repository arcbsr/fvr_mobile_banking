import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/privacy/privacy_bloc.dart';
import '../bloc/privacy/privacy_event.dart';
import '../bloc/privacy/privacy_state.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrivacyBloc(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: BlocConsumer<PrivacyBloc, PrivacyState>(
          listener: (context, state) {
            // Optional: show snackbar on toggle
          },
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                Text('privacySecurity'.tr(), style: AppTextStyles.header),
                Text(
                  'privacySecuritySubTitle'.tr(),
                  style: AppTextStyles.body.copyWith(color: Colors.grey[500]),
                ),
                SizedBox(height: 40.h),
                _sectionTitle('account'.tr()),
                _tileWithArrow(
                  icon: Icons.lock_outline,
                  title: 'changeAccountPassword'.tr(),
                  onTap: () {
                    // Navigate to password screen
                  },
                ),
                _toggleTile(
                  icon: Icons.remove_red_eye_outlined,
                  title: 'privacyMode'.tr(),
                  subtitle: 'privacyModeSubTitle'.tr(),
                  value: state.privacyMode,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(TogglePrivacyMode());
                  },
                ),
                 SizedBox(height: 40.h),
                _sectionTitle('lockScreen'.tr()),
                _tileWithArrow(
                  icon: Icons.pin_outlined,
                  title: 'changeLockPIN'.tr(),
                  onTap: () {
                    // Navigate to pin screen
                  },
                ),
                _toggleTile(
                  icon: Icons.fingerprint,
                  title: 'fingerprintUnlock'.tr(),
                  value: state.fingerprintUnlock,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(ToggleFingerprintUnlock());
                  },
                ),
                _toggleTile(
                  icon: Icons.lock_clock,
                  title: 'autoLock'.tr(),
                  value: state.autoLock,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(ToggleAutoLock());
                  },
                ),
                 SizedBox(height: 40.h),
                _sectionTitle('appTheme'.tr()),
                _toggleTile(
                  icon: Icons.dark_mode,
                  title: 'darkMode'.tr(),
                  value: state.darkMode,
                  onChanged: (_) {
                    context.read<PrivacyBloc>().add(ToggleDarkMode());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppTextStyles.title,
      ),
    );
  }

  Widget _tileWithArrow({
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
      title: Text(title, style: AppTextStyles.body),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _toggleTile({
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
      title: Text(title,style: AppTextStyles.body),
      subtitle: subtitle != null ? Text(subtitle, style: AppTextStyles.body.copyWith(color: Colors.grey[500])) : null,
      activeColor: Colors.green, // ✅ thumb (circle) color when ON
      activeTrackColor: Colors.green.shade50, // ✅ track (bar) color when ON
      inactiveThumbColor: Colors.grey, // optional
      inactiveTrackColor: Colors.grey.shade300, // optional
      value: value,
      onChanged: onChanged,
    );
  }
}
