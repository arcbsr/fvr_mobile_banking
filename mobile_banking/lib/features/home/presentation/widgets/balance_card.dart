import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moix_app/core/theme/app_theme.dart';
import '../../data/repositories/demo_home_repository.dart';
import '../../domain/entities/user_entity.dart';
import 'package:moix_app/l10n/app_localizations.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _repo = DemoHomeRepository();
    return FutureBuilder<User>(
      future: _repo.getUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                gradient: const LinearGradient(
                  colors: [Color(0xFF270685), Color(0xFF5732BF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          );
        }
        // For demo, hardcode balance and currency
        final balance = '14 235,21';
        final currency = kDemoCurrency;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              gradient: const LinearGradient(
                colors: [Color(0xFF270685), Color(0xFF5732BF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // TODO: Add geometric background pattern as an asset or custom painter
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 21.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.mainBalance,
                        style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.7)),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Baseline(
                            baseline: 32.sp,
                            baselineType: TextBaseline.alphabetic,
                            child: Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20.sp),
                          ),
                          SizedBox(width: 12.w),
                          Baseline(
                            baseline: 32.sp,
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                              balance,
                              style: AppTextStyles.extraHeader.copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Baseline(
                            baseline: 32.sp,
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                              currency,
                              style: AppTextStyles.body.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _ActionButton(
                              icon: Image.asset(
                                'assets/icons/money_recive.png',
                                width: 28.w,
                                height: 28.w,
                                color: Colors.white,
                              ),
                              label: AppLocalizations.topUp,
                              onTap: () {},
                            ),
                          ),
                          Container(
                            width: 1.w,
                            height: 48.h,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          Expanded(
                            child: _ActionButton(
                              icon: Image.asset(
                                'assets/icons/convert.png',
                                width: 28.w,
                                height: 28.w,
                                color: Colors.white,
                              ),
                              label: AppLocalizations.transfer,
                              onTap: () {},
                            ),
                          ),
                        ],
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

class _ActionButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Center(child: icon),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
} 