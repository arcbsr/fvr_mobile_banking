import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'scan_qrCode'.tr(),
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'scan_fastPayments'.tr(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF8A939B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 36.h),
            Center(
              child: SizedBox(
                width: 200.w,
                height: 200.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Border
                    Container(
                      width: 200.w,
                      height: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        border: Border.all(
                          color: const Color(0xFFCED2D9),
                          width: 2.w,
                        ),
                      ),
                    ),
                    // Green scanning line
                    Positioned(
                      top: 100.w - 2.h,
                      left: 24.w,
                      right: 24.w,
                      child: Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4DA66B),
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                      ),
                    ),
                    // Subtle gradient below the line
                    Positioned(
                      top: 100.w,
                      left: 24.w,
                      right: 24.w,
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF4DA66B).withOpacity(0.15),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer to push buttons to the bottom
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ScanActionCard(
                    icon: Icons.qr_code_scanner,
                    iconBg: const Color(0xFFE6F4EA),
                    iconColor: const Color(0xFF4DA66B),
                    title: 'scan_scanQrCode'.tr(),
                    subtitle: 'scan_pointScanPay'.tr(),
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  _ScanActionCard(
                    icon: Icons.qr_code_2_rounded,
                    iconBg: const Color(0xFFF7F5FF),
                    iconColor: const Color(0xFF6F45E9),
                    title: 'scan_myQrCode'.tr(),
                    subtitle: 'scan_showQrToGetPaid'.tr(),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScanActionCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _ScanActionCard({
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
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE6E6F0), width: 1),
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
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF8A939B),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: Colors.grey[400], size: 22.sp),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        minLeadingWidth: 0,
      ),
    );
  }
} 