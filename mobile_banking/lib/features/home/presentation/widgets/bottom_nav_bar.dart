import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavBarItem(
        iconPath: 'assets/icons/ic_home.png',
        label: 'Home',
        selected: currentIndex == 0,
        onTap: () => onTap(0),
      ),
      _NavBarItem(
        iconPath: 'assets/icons/ic_card.png',
        label: 'Cards',
        selected: currentIndex == 1,
        onTap: () => onTap(1),
      ),
      _NavBarItem(
        iconPath: 'assets/icons/ic_home.png',
        label: 'Scan',
        selected: currentIndex == 2,
        onTap: () => onTap(2),
      ),
      _NavBarItem(
        iconPath: 'assets/icons/ic_transfer.png',
        label: 'Transfer',
        selected: currentIndex == 3,
        onTap: () => onTap(3),
      ),
      _NavBarItem(
        iconPath: 'assets/icons/ic_more.png',
        label: 'More',
        selected: currentIndex == 4,
        onTap: () => onTap(4),
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF270685).withOpacity(0.06),
            blurRadius: 16.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _NavBarItem({required this.iconPath, required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final Color iconColor = selected ? primary : const Color(0xFF8A939B);
    final Color textColor = selected ? primary : const Color(0xFF8A939B);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              width: 28.w,
              height: 28.w,
              color: iconColor,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: textColor,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 