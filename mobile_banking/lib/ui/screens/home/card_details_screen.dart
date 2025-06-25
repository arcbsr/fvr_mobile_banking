import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/mobix_card.dart';
import '../../../core/theme/app_theme.dart';
import 'package:moix_app/domain/entities/card_entity.dart';
import 'package:easy_localization/easy_localization.dart';

class CardDetailsScreen extends StatelessWidget {
  final DemoCard card;
  const CardDetailsScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 22.sp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Mobix Premium', style: AppTextStyles.header.copyWith(fontSize: 18.sp)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: MobixCard(card: card),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Spacer(),
                  // NFC prompt
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.nfc, color: Colors.grey[400], size: 48.sp),
                        SizedBox(height: 8.h),
                        Text(
                          'moveToPay'.tr(),
                          style: AppTextStyles.body.copyWith(
                            color: Colors.grey[400],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Card Options section
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('cardOptions'.tr(), style: AppTextStyles.header.copyWith(fontSize: 16.sp)),
                        SizedBox(height: 16.h),
                        _CardOption(
                          icon: Icons.attach_money,
                          iconBg: const Color(0xFFE6F4EA),
                          iconColor: const Color(0xFF4DA66B),
                          title: 'topUpCard'.tr(),
                          subtitle: 'chooseTopUp'.tr(),
                        ),
                        SizedBox(height: 16.h),
                        _CardOption(
                          icon: Icons.bar_chart,
                          iconBg: const Color(0xFFFDEEEF),
                          iconColor: const Color(0xFFF37C7B),
                          title: 'limits'.tr(),
                          subtitle: 'checkLimits'.tr(),
                        ),
                        SizedBox(height: 16.h),
                        _CardOption(
                          icon: Icons.warning_amber_rounded,
                          iconBg: const Color(0xFFF2F0FE),
                          iconColor: const Color(0xFF6F45E9),
                          title: 'freezeCard'.tr(),
                          subtitle: 'lostCard'.tr(),
                        ),
                        SizedBox(height: 64.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 32.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6F45E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_2_rounded, color: Colors.white, size: 24.sp),
                    SizedBox(width: 8.w),
                    Text('QR Pay', style: AppTextStyles.button.copyWith(fontSize: 18.sp)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardOption extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  const _CardOption({required this.icon, required this.iconBg, required this.iconColor, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22.sp),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.header.copyWith(fontSize: 15.sp)),
              SizedBox(height: 4.h),
              Text(subtitle, style: AppTextStyles.body.copyWith(color: Colors.grey[600], fontSize: 13.sp)),
            ],
          ),
        ),
      ],
    );
  }
} 