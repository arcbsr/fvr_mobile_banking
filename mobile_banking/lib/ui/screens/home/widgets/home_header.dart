import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moix_app/domain/repositories/demo_home_repository.dart';
import 'package:moix_app/core/theme/app_theme.dart';
import 'package:moix_app/ui/screens/settings/language_settings_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});
  final _repo = DemoHomeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repo.getUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(height: 60.h); // Placeholder height
        }
        final user = snapshot.data!;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: AssetImage(user.avatarUrl),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'helloUser'.tr(namedArgs: {'name': user.name}),
                    style: AppTextStyles.title,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4DA66B),
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    child: Text(
                      'earnAmount'.tr(namedArgs: {'amount': user.earnAmount.toString()}),
                      style: AppTextStyles.body.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageSettingsScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(Icons.notifications_none_rounded,
                            size: 32.sp, color: const Color(0xFF191919)),
                        if (user.notificationCount > 0)
                          Positioned(
                            right: 2.w,
                            top: -2.h,
                            child: Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE05555),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
