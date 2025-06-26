import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/data/repositories/demo_home_repository.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});
  final _repo = DemoHomeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repo.getUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundImage: AssetImage(user.avatarUrl),
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
                            user.phoneNumber,
                            style: AppTextStyles.body.copyWith(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    children: [
                      _SectionTitle('General Settings'),
                      _MoreTile(
                        icon: Icons.person_outline,
                        label: 'myAccount'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.business_outlined,
                        label: 'openBusinessAccount'.tr(),
                        onTap: () {},
                      ),
                      SizedBox(height: 18.h),
                      _SectionTitle('helpAndSettings'.tr()),
                      _MoreTile(
                        icon: Icons.language,
                        label: 'changeLanguage'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.privacy_tip_outlined,
                        label: 'privacySecurity'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.support_agent_outlined,
                        label: 'contactSupport'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.send_outlined,
                        label: 'sendFeedback'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.info_outline,
                        label: 'aboutMobix'.tr(),
                        onTap: () {},
                      ),
                      _MoreTile(
                        icon: Icons.delete_outline,
                        label: 'deleteAccount'.tr(),
                        onTap: () {},
                      ),
                      SizedBox(height: 24.h),
                      Center(
                        child: TextButton(
                          onPressed: () {},
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
              ],
            ),
          ),
        );
      },
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
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _MoreTile({required this.icon, required this.label, required this.onTap});
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
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey[400], size: 22.sp),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
        minLeadingWidth: 0,
      ),
    );
  }
} 