import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/settings/settings_bloc.dart';
import '../bloc/settings/settings_event.dart';
import '../bloc/settings/settings_state.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is DeleteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('deleteAccountConfirmMsg'.tr())),
          );
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        } else if (state is DeleteFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        }
      },
      builder: (context, state) {
        final isLoading = state is DeletingAccount;

        return WillPopScope(
          onWillPop: () async {
            context.read<SettingsBloc>().add(
              LoadSettings(),
            ); // reset before pop
            return true; // allow pop
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('deleteAccount'.tr(),style: AppTextStyles.title,),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_forever, size: 100, color: Colors.red),
                    SizedBox(height: 24),
                    Text(
                      'deleteAccountConfirmation'.tr(),
                      style: AppTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'deleteAccountNotice'.tr(),
                      style: AppTextStyles.body.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<SettingsBloc>().add(LoadSettings());
                      },
                      child: Text('deleteAccountLatterButton'.tr(),style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                      )),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              context.read<SettingsBloc>().add(
                                ConfirmDeleteAccount(),
                              );
                            },
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('deleteAccountConfirmButton'.tr(),style: AppTextStyles.title.copyWith(
                        color: Colors.white,
                      )),
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
