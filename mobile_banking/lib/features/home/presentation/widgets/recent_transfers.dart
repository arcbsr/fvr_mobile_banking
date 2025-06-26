import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/repositories/demo_home_repository.dart';
import 'package:moix_app/core/theme/app_theme.dart';
import '../../domain/entities/beneficiary_entity.dart';
import 'package:moix_app/l10n/app_localizations.dart';

class RecentTransfers extends StatelessWidget {
  RecentTransfers({super.key});
  final _repo = DemoHomeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Beneficiary>>(
      future: _repo.getRecentTransfers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(height: 80.h); // Placeholder height
        }
        final beneficiaries = snapshot.data!;
        return Padding(
          padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.recentTransfers,
                    style: AppTextStyles.title,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.viewAll,
                      style: AppTextStyles.caption,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 90.h,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: beneficiaries.length + 1,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _AddBeneficiary();
                      }
                      final b = beneficiaries[index - 1];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28.r,
                            backgroundImage: AssetImage(b.avatarUrl),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            b.name,
                            style: AppTextStyles.body.copyWith(fontSize: 13.sp),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AddBeneficiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: const Color(0xFFE6DDFF),
          child: Icon(Icons.add, color: const Color(0xFF6F45E9), size: 28.r),
        ),
        SizedBox(height: 8.h),
        Text(
          AppLocalizations.addCard,
          style: AppTextStyles.body.copyWith(fontSize: 13.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 