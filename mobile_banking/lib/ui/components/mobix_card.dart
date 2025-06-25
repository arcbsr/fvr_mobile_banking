import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_theme.dart';
import 'package:mobile_banking/domain/entities/card_entity.dart';

class MobixCard extends StatelessWidget {
  final DemoCard card;
  const MobixCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
              mainAxisSize: MainAxisSize.min,
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
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      card.maskedNumber,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  card.cardholderName,
                  style: AppTextStyles.title.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valid Thru - ${card.expiry}',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    if (card.cvv != null && card.cvv.isNotEmpty)
                      Text(
                        'CVV - ${card.cvv}',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 48.h),
                Text(
                  'Balance',
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14.sp,
                  ),
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
                        style: AppTextStyles.title.copyWith(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        card.currency,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.nfc, color: Colors.white, size: 28.sp),
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