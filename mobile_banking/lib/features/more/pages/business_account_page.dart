import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_event.dart';
import '../bloc/settings/settings_state.dart';

class BusinessAccountPage extends StatelessWidget {
  const BusinessAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is BusinessAccountCreatedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('deleteAccountConfirmMsg'.tr())),
          );
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        } else if (state is BusinessAccountCreatedFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        }
      },
      builder: (context, state) {
        final isLoading = state is CreatingBusinessAccount;

        return WillPopScope(
          onWillPop: () async {
            context.read<SettingsBloc>().add(
              LoadSettings(),
            ); // reset before pop
            return true; // allow pop
          },
          child: Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'businessAccount'.tr(),
                            style:AppTextStyles.header,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'businessAccountSubTitle'.tr(),
                            style: AppTextStyles.body.copyWith(
                              color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    //if (state is BusinessAccountEmpty)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.business_center_outlined,
                              size: 80,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'noBusinessAccount'.tr(),
                              style: AppTextStyles.body.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                   /* if (state is BusinessAccountLoaded)
                      Expanded(
                        child: Center(
                          child: Text(
                            "Welcome, ${state.accountName}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),*/
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                          context.read<SettingsBloc>().add(
                            CreatedBusinessAccount(),
                          );
                        },
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('openBusinessAccount'.tr(), style: AppTextStyles.title.copyWith(
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
