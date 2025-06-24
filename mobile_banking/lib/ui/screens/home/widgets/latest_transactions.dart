import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/data/demo_data.dart';
import 'package:mobile_banking/core/theme/app_theme.dart';

class LatestTransactions extends StatelessWidget {
  const LatestTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Transactions',
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
          Expanded(
            child: ListView.separated(
              itemCount: demoTransactions.length,
              separatorBuilder: (_, __) => SizedBox(height: 0.h),
              itemBuilder: (context, index) {
                final tx = demoTransactions[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF270685).withOpacity(0.05),
                        blurRadius: 1.r,
                        offset: Offset(0, 0.h),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: SizedBox(
                          width: 38.w,
                          height: 38.h,
                          child: Image.asset(
                            tx.logoUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[300],
                              child: Icon(Icons.broken_image, size: 24.sp, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Text(
                                  tx.date,
                                  style: AppTextStyles.caption.copyWith(color: const Color(0xFF78838D)),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  tx.time,
                                  style: AppTextStyles.caption.copyWith(color: const Color(0xFF78838D)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            tx.amount,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w600,
                              color: tx.isCredit ? const Color(0xFF4DA66B) : const Color(0xFFB83232),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 