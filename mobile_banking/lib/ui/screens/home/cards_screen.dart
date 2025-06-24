import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../../../core/theme/app_theme.dart';
import '../../components/mobix_card.dart';
import '../../../models/demo_models.dart';
import 'card_details_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int _selectedIndex = 0;
  late List<DemoCard> cards;

  @override
  void initState() {
    super.initState();
    cards = [
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Visa',
        maskedNumber: '**** 1234',
        expiry: '12/26',
        gradient: const LinearGradient(
          colors: [Color(0xFF270685), Color(0xFF5732BF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Mastercard',
        maskedNumber: '**** 5678',
        expiry: '09/25',
        gradient: const LinearGradient(
          colors: [Color(0xFF4DA66B), Color(0xFF6F45E9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Amex',
        maskedNumber: '**** 9012',
        expiry: '03/27',
        gradient: const LinearGradient(
          colors: [Color(0xFF191970), Color(0xFF00BFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Discover',
        maskedNumber: '**** 3456',
        expiry: '11/28',
        gradient: const LinearGradient(
          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Cards', style: AppTextStyles.header.copyWith(fontSize: 22.sp)),
              InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Add card',
                      style: AppTextStyles.header.copyWith(
                        fontSize: 18.sp,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableHeight = constraints.maxHeight - 16.h;
                final n = cards.length;
                double cardHeight = 220.h;
                double cardOverlap = cardHeight * 0.25;
                double stackHeight = cardHeight + (n - 1) * cardOverlap;
                if (stackHeight > availableHeight) {
                  cardHeight = availableHeight / (1 + 0.25 * (n - 1));
                  cardOverlap = cardHeight * 0.25;
                  stackHeight = cardHeight + (n - 1) * cardOverlap;
                }
                return Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: stackHeight,
                    child: Stack(
                      children: [
                        for (int i = 0; i < cards.length; i++)
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                            top: i * cardOverlap,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CardDetailsScreen(card: cards[i]),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: cardHeight,
                                child: MobixCard(card: cards[i]),
                              ),
                            ),
                          ),
                      ],
                    ),
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

class _CardWidget extends StatelessWidget {
  final DemoCard card;
  const _CardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: card.gradient,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
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
              width: 140.w,
              height: 140.w,
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
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ic_home.png', // Replace with Mobix logo asset
                          width: 32.w,
                          height: 32.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Mobix',
                          style: AppTextStyles.header.copyWith(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Premium',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '**** **** 3245',
                      style: AppTextStyles.header.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  'ABDULLAH MAHMUD',
                  style: AppTextStyles.header.copyWith(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valid Thru - 05 / 32',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      'CVV - 5485',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  'Balance',
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.remove_red_eye_outlined, color: Colors.white, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      '1547,00',
                      style: AppTextStyles.title.copyWith(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        'DZD',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.nfc, color: Colors.white, size: 28.sp),
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

class _CardActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _CardActionButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor, size: 18.sp),
            SizedBox(width: 6.w),
            Text(
              label,
              style: AppTextStyles.body.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardDetailsSection extends StatelessWidget {
  final DemoCard card;
  const _CardDetailsSection({required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.maskedNumber,
            style: AppTextStyles.title.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card.type,
                style: AppTextStyles.body.copyWith(fontSize: 16.sp),
              ),
              Text(
                card.expiry,
                style: AppTextStyles.body.copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CardActionButton(label: 'Top Up', icon: Icons.arrow_downward, onTap: () {}),
              _CardActionButton(label: 'Freeze', icon: Icons.ac_unit, onTap: () {}),
              _CardActionButton(label: 'Details', icon: Icons.info_outline, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
} 