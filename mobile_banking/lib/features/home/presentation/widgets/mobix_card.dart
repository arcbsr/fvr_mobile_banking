import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/card_entity.dart';
import 'package:moix_app/l10n/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class MobixCard extends StatelessWidget {
  final DemoCard card;
  final double? height;
  const MobixCard({super.key, required this.card, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 22.h),
      decoration: BoxDecoration(
        gradient: card.gradient,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 2.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Yellow arc (bottom right)
          Positioned(
            right: -40.w,
            bottom: -40.w,
            child: Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFFFD600),
                  width: 4.w,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Card content
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          card.logo,
                          width: 20.w,
                          height: 20.w,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          card.type,
                          style: AppTextStyles.title.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      card.maskedNumber,
                      style: AppTextStyles.title.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  card.cardholderName,
                  style: AppTextStyles.body.copyWith(color: Colors.white, fontSize: 18.sp),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'validThru'.tr(namedArgs: {'expiry': card.expiry}),
                      style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.7)),
                    ),
                    if (card.cvv != null && card.cvv.isNotEmpty)
                      Text(
                        AppLocalizations.cvv + ' - ${card.cvv}',
                        style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.7)),
                      ),
                  ],
                ),
                SizedBox(height: 32.h),
                Text(
                  AppLocalizations.balance,
                  style: AppTextStyles.body.copyWith(color: Colors.white.withOpacity(0.7)),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Baseline(
                      baseline: 20.sp,
                      baselineType: TextBaseline.alphabetic,
                      child: Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20.sp),
                    ),
                    SizedBox(width: 8.w),
                    Baseline(
                      baseline: 20.sp,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        card.balance,
                        style: AppTextStyles.title.copyWith(color: Colors.white, fontSize: 20.sp),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Baseline(
                      baseline: 20.sp,
                      baselineType: TextBaseline.alphabetic,
                      child: Text(
                        card.currency,
                        style: AppTextStyles.body.copyWith(color: Colors.white),
                      ),
                    ),
                    Expanded(child: Container()),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/icons/ic_nfc.png',
                        width: 28.w,
                        height: 28.w,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 