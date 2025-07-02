import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/about/about_bloc.dart';
import '../bloc/about/about_event.dart';
import '../bloc/about/about_state.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutBloc()..add(LoadAboutInfo()),
      child: BlocConsumer<AboutBloc, AboutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.white),
            body: Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 20.h,
                right: 20.w,
                bottom: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('aboutUs'.tr(), style: AppTextStyles.header),
                   Text('aboutUsSubTitle'.tr(), style: AppTextStyles.body.copyWith(color: Colors.grey[500])),
                   SizedBox(height: 30.h),
                  _buildRateTile(
                    icon: Icons.apple,
                    title: 'rateUsAppStore'.tr(),
                    color: Colors.blue.shade100,
                    onTap: () {
                      // launch Apple store link
                    },
                  ),
                   SizedBox(height: 12.h),
                  _buildRateTile(
                    icon: Icons.android,
                    title: 'rateUsPlayStore'.tr(),
                    color: Colors.green.shade100,
                    onTap: () {
                      // launch Play store link
                    },
                  ),
                   SizedBox(height: 32.h),
                  Text(
                    'socialMedia'.tr(),
                    style: AppTextStyles.header,
                  ),
                  Text('followUsOn'.tr(),style: AppTextStyles.body.copyWith(color: Colors.grey[500])),
                  SizedBox(height: 16.h),
                  _buildSocialTile(
                    "Facebook",
                    "@mobixPay",
                    Icons.facebook,
                    Colors.blue,
                  ),
                  _buildSocialTile(
                    "Instagram",
                    "@mobixPay",
                    Icons.camera_alt,
                    Colors.purple,
                  ),
                  _buildSocialTile(
                    "TikTok",
                    "@mobixPay",
                    Icons.movie,
                    Colors.black,
                  ),
                  _buildSocialTile(
                    "YouTube",
                    "@mobixPay",
                    Icons.play_circle_fill,
                    Colors.red,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRateTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.title,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialTile(
    String name,
    String handle,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(name,style: AppTextStyles.title),
      subtitle: Text(handle,style: AppTextStyles.body.copyWith(
        color: Colors.grey[500],
      )),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Launch link
      },
    );
  }
}
