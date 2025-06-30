import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import 'delete_account_page.dart';
import 'my_account_page.dart';

class MoreScreens extends StatelessWidget {
  const MoreScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc()..add(LoadSettings()),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is DeleteAccountState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<SettingsBloc>(), // provide the existing bloc
                  child: DeleteAccountPage(),
                ),
              ),
            );
          /*  Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DeleteAccountPage()),
            );*/
          }
          else if (state is MyAccountState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<SettingsBloc>(), // provide the existing bloc
                  child: MyAccountPage(),
                ),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      if (state is SettingsLoaded) {
                        final user = state.user;
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 24.r,
                              backgroundImage: AssetImage(user.avatarUrl??""),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, ${user.name}!',
                                  style: AppTextStyles.title,
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  user.phoneNumber??"",
                                  style: AppTextStyles.body.copyWith(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return SizedBox(); // or loading placeholder
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      if (state is SettingsLoaded) {
                        return ListView(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          children: state.items.map((item) {
                            if (item.isSectionTitle) {
                              return _SectionTitle(item.title); // Section header
                            }
                            return _MoreTile(
                              icon: item.icon,
                              label: item.title,
                              onTap: () {
                                if (item.title == 'myAccount'.tr()) {
                                  context.read<SettingsBloc>().add(MyAccountPressed());
                                }
                                else if (item.title == 'deleteAccount'.tr()) {
                                  context.read<SettingsBloc>().add(DeleteAccountPressed());
                                }
                              },
                            );
                          }).toList(),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: TextButton(
                    onPressed: () {
                       // context.read<SettingsBloc>().add(LogoutPressed());
                    },
                    child: Text(
                      'logout'.tr(),
                      style: AppTextStyles.body.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
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
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: AppTextStyles.body.copyWith(
          color: Colors.grey[500],
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}

class _MoreTile extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onTap;

  const _MoreTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5FF),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[500], size: 26.sp),
        title: Text(
          label,
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Icons.chevron_right_rounded,
          color: Colors.grey[400],
          size: 22.sp,
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
        minLeadingWidth: 0,
      ),
    );
  }
}
