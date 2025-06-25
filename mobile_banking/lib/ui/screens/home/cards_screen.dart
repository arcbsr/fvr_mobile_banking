import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import '../../../core/theme/app_theme.dart';
import '../../components/mobix_card.dart';
import 'card_details_screen.dart';
import 'package:moix_app/domain/repositories/demo_home_repository.dart';
import 'package:moix_app/domain/entities/card_entity.dart';
import 'package:moix_app/l10n/app_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final _repo = DemoHomeRepository();
  bool expanded = false;
  int? lastCardIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DemoCard>>(
      future: _repo.getCards(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final cards = snapshot.data!;
        // Always move the last tapped card to the last position in collapsed mode
        List<DemoCard> orderedCards = List.from(cards);
        if (!expanded && lastCardIndex != null) {
          final card = orderedCards.removeAt(lastCardIndex!);
          orderedCards.add(card);
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.myCards, style: AppTextStyles.header.copyWith(fontSize: 22.sp)),
                  InkWell(
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.addCard,
                          style: AppTextStyles.header.copyWith(
                            color: Theme.of(context).primaryColor,
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
                child: GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null && details.primaryVelocity! > 100) {
                      // Swipe down to expand
                      setState(() => expanded = true);
                    }
                  },
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final availableHeight = constraints.maxHeight - 16.h;
                      final n = orderedCards.length;
                      double cardHeight = 220.h;
                      double cardOverlap = cardHeight * 0.25;
                      double stackHeight = cardHeight + (n - 1) * cardOverlap;
                      if (stackHeight > availableHeight) {
                        cardHeight = availableHeight / (1 + 0.25 * (n - 1));
                        cardOverlap = cardHeight * 0.25;
                        stackHeight = cardHeight + (n - 1) * cardOverlap;
                      }
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: expanded
                            ? ListView.builder(
                                key: const ValueKey('expanded'),
                                itemCount: orderedCards.length,
                                itemBuilder: (context, i) => Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        expanded = false;
                                        lastCardIndex = i;
                                      });
                                    },
                                    child: MobixCard(card: orderedCards[i]),
                                  ),
                                ),
                              )
                            : Align(
                                key: const ValueKey('collapsed'),
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  height: stackHeight,
                                  child: Stack(
                                    children: [
                                      for (int i = 0; i < orderedCards.length; i++)
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
                                                  builder: (context) => CardDetailsScreen(card: orderedCards[i]),
                                                ),
                                              );
                                            },
                                            child: SizedBox(
                                              height: cardHeight,
                                              child: MobixCard(card: orderedCards[i]),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
                          card.logo,
                          width: 32.w,
                          height: 32.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          card.type,
                          style: AppTextStyles.header.copyWith(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Optionally, add a card tier or other info if available in DemoCard
                      ],
                    ),
                    Text(
                      card.maskedNumber,
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
                  card.cardholderName,
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
                      'validThru'.tr(namedArgs: {'expiry': card.expiry}),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13.sp,
                      ),
                    ),
                    // Optionally, add CVV if available in DemoCard
                  ],
                ),
                SizedBox(height: 18.h),
                // Optionally, add balance if available in DemoCard
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
              _CardActionButton(label: 'topUp'.tr(), icon: Icons.arrow_downward, onTap: () {}),
              _CardActionButton(label: 'Freeze', icon: Icons.ac_unit, onTap: () {}),
              _CardActionButton(label: 'freeze'.tr(), icon: Icons.ac_unit, onTap: () {}),
              _CardActionButton(label: 'Details', icon: Icons.info_outline, onTap: () {}),
              _CardActionButton(label: 'details'.tr(), icon: Icons.info_outline, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
} 