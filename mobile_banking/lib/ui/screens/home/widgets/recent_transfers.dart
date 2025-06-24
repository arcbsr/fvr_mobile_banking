import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/data/demo_data.dart';
import 'package:mobile_banking/core/theme/app_theme.dart';

class RecentTransfers extends StatelessWidget {
  const RecentTransfers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transfers',
                style: AppTextStyles.title,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            height: 82.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: demoBeneficiaries.length + 1,
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _AddBeneficiary();
                }
                final beneficiary = demoBeneficiaries[index - 1];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 24.w,
                      backgroundImage: AssetImage(beneficiary.avatarUrl),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 56.w,
                      child: Text(
                        beneficiary.name,
                        style: AppTextStyles.caption,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AddBeneficiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: const Color(0xFFE6DDFF),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: const Color(0xFF6F45E9), size: 28.sp),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 56.w,
          child: Text(
            'Add',
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
} 