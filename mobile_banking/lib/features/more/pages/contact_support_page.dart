import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../bloc/support/support_bloc.dart';
import '../bloc/support/support_event.dart';
import '../bloc/support/support_state.dart';

class ContactSupportPage extends StatelessWidget {
  final List<String> issues = const [
    'App Crash',
    'Payment Problem',
    'Feature Request',
    'Other',
  ];

  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SupportBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocConsumer<SupportBloc, SupportState>(
            listener: (context, state) {
              print(
                "Issue Test: ${state.selectedIssue}, Details: ${state.details}",
              );

              if (state.submitted) {
                //print("test ---${state.submitted} ${state.selectedIssue} .. ${state.details}");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("✅ Request submitted successfully!"),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 20.h,
                  right: 20.w,
                  bottom: 20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('contactSupport'.tr(), style: AppTextStyles.header.copyWith(color: Theme.of(context).textTheme.titleLarge?.color)),
                    const SizedBox(height: 16),
                    Text('contactSupportSubTitle'.tr(),style: AppTextStyles.body.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color)),
                    const SizedBox(height: 24),
                    _buildContactOption(
                      icon: Icons.email_outlined,
                      title: 'emailUs'.tr(),
                      subtitle: "support@mobix.dz",
                      onTap: () {
                        // TODO: Implement email launch
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildContactOption(
                      icon: Icons.phone_in_talk,
                      title: 'callUs'.tr(),
                      subtitle: "+213 777 12 12 155",
                      onTap: () {
                        // TODO: Implement phone call
                      },
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'onlineSupport'.tr(),
                      style: AppTextStyles.title.copyWith(color: Theme.of(context).textTheme.titleLarge?.color),
                    ),
                    SizedBox(height: 12.h),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'selectIssue'.tr(),
                      ),
                      value: state.selectedIssue.isEmpty
                          ? null
                          : state.selectedIssue,
                      items: issues
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          context.read<SupportBloc>().add(IssueSelected(value));
                        }
                      },
                    ),
                    SizedBox(height: 12.h),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'explainDetails'.tr(),
                      ),
                      maxLines: 4,
                      onChanged: (text) =>
                          context.read<SupportBloc>().add(DetailsChanged(text)),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () {
                          context.read<SupportBloc>().add(
                            SubmitSupportRequest(),
                          );
                        },
                        child: Text('submit'.tr(),style: AppTextStyles.title.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                      ),
                    ),
                    /* if (state.submitted)
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text("Submitted!", style: TextStyle(color: Colors.green)),
                      ),*/
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(icon, color: Colors.deepPurple),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.w, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
