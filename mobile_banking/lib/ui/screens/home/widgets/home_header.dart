import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/data/demo_data.dart';
import 'package:mobile_banking/core/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage(demoUser.avatarUrl),
              ),
              SizedBox(width: 12.w),
              Text(
                'Hello, Abdullah!',
                style: AppTextStyles.header,
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
                  'Earn 300 DZD',
                  style: AppTextStyles.body.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 12.w),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications_none_rounded,
                      size: 32.sp, color: const Color(0xFF191919)),
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
            ],
          ),
        ],
      ),
    );
  }
}
