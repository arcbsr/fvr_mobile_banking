import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/repositories/demo_home_repository.dart';
import 'package:moix_app/core/theme/app_theme.dart';
import '../../domain/entities/transaction_entity.dart';
import 'package:easy_localization/easy_localization.dart';

class LatestTransactions extends StatelessWidget {
  LatestTransactions({super.key});
  final _repo = DemoHomeRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _repo.getTransactions(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final transactions = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('latestTransactions'.tr(), style: AppTextStyles.header),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement view all action
                    },
                    child: Text('viewAll'.tr(), style: AppTextStyles.caption),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder: (_, __) => SizedBox(height: 14.h),
                itemBuilder: (context, index) {
                  final tx = transactions[index];
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
                                style: AppTextStyles.title,
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  Text(
                                    tx.date,
                                    style: AppTextStyles.caption,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    tx.time,
                                    style: AppTextStyles.caption,
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
                              style: AppTextStyles.title.copyWith(
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
        );
      },
    );
  }
} 