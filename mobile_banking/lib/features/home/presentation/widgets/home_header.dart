import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import 'package:moix_app/core/theme/app_theme.dart';
import '../../../settings/presentation/pages/language_settings_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeAccountsLoaded && state.accountsData.data != null && state.accountsData.data!.isNotEmpty) {
          final userName = state.accountsData.userName ?? 'User';
          final profileImage = state.accountsData.profileImageUrl ?? 'assets/icons/avatar.png';
          final isKycVerified = state.accountsData.isKycVerified == 1;
          
          return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage: profileImage.startsWith('http') 
                          ? NetworkImage(profileImage) as ImageProvider
                          : AssetImage(profileImage) as ImageProvider,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'helloUser'.tr(namedArgs: {'name': userName}),
                      style: AppTextStyles.header,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: isKycVerified ? const Color(0xFF4DA66B) : const Color(0xFFFFA500),
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    child: Text(
                      isKycVerified ? 'KYC Verified' : 'KYC Pending',
                      style: AppTextStyles.body.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageSettingsScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(Icons.notifications_none_rounded,
                            size: 32.sp, color: const Color(0xFF191919)),
                        if (isKycVerified)
                          Positioned(
                            right: 2.w,
                            top: -2.h,
                            child: Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE05555),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        } else if (state is HomeLoading) {
          return SizedBox(height: 60.h); // Loading placeholder
        } else if (state is HomeError) {
          return SizedBox(height: 60.h); // Error placeholder
        } else {
          return SizedBox(height: 60.h); // Initial state placeholder
        }
      },
    );
  }
}
