import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/recent_transfers.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/theme/app_theme.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 0),
          children: [
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'transfer'.tr(),
                style: AppTextStyles.header,
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFFE6E6F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F5FF),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(Icons.sync_alt, color: Color(0xFF6F45E9), size: 20.sp),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'topUpRequest'.tr(),
                            style: AppTextStyles.title,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '24 Jan 12:32',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '+ 1 504,00 DZD',
                      style: AppTextStyles.title.copyWith(color: Color(0xFF4DA66B)),
                    ),
                    Icon(Icons.chevron_right_rounded, color: Colors.grey[400], size: 22.sp),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            RecentTransfers(),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'actions'.tr(),
                style: AppTextStyles.header,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _ActionTile(
                    icon: Icons.swap_horiz,
                    iconBg: const Color(0xFFE6F4EA),
                    iconColor: const Color(0xFF4DA66B),
                    title: 'newTransfer'.tr(),
                    subtitle: 'newTransferDesc'.tr(),
                    onTap: () {},
                  ),
                  _ActionTile(
                    icon: Icons.request_page_outlined,
                    iconBg: const Color(0xFFFDEEEF),
                    iconColor: const Color(0xFFF37C7B),
                    title: 'requestMoney'.tr(),
                    subtitle: 'requestMoneyDesc'.tr(),
                    onTap: () {},
                  ),
                  _ActionTile(
                    icon: Icons.send_outlined,
                    iconBg: const Color(0xFFF7F5FF),
                    iconColor: const Color(0xFF6F45E9),
                    title: 'sentRequest'.tr(),
                    subtitle: 'sentRequestDesc'.tr(),
                    onTap: () {},
                  ),
                  _ActionTile(
                    icon: Icons.inbox_outlined,
                    iconBg: const Color(0xFFE6F4FF),
                    iconColor: const Color(0xFF6F45E9),
                    title: 'receivedRequest'.tr(),
                    subtitle: 'receivedRequestDesc'.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _ActionTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: ListTile(
        leading: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 26.sp),
        ),
        title: Text(
          title,
          style: AppTextStyles.title,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.caption,
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey[400], size: 22.sp),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        minLeadingWidth: 0,
      ),
    );
  }
} 