import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../../home/data/repositories/demo_home_repository.dart';
import '../bloc/feedback/feedback_bloc.dart';
import '../bloc/feedback/feedback_event.dart';
import '../bloc/feedback/feedback_state.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          FeedbackBloc(DemoHomeRepository())..add(LoadFeedbackUser()),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: BlocConsumer<FeedbackBloc, FeedbackState>(
          listener: (context, state) {
            if (state.submitted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("🎉 Thank you for your feedback!"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FeedbackState) {
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
                    Text('sendFeedback'.tr(), style: AppTextStyles.header),
                    Text(
                      'sendFeedbackSubTitle'.tr(),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                state.user?.avatarUrl?.isNotEmpty == true
                                ? AssetImage(state.user!.avatarUrl!)
                                : null,
                            //AssetImage(state.user?.avatarUrl ?? ""),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            state.user?.name ?? "",
                            style: AppTextStyles.title,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'howWasYourExperience'.tr(),
                            style: AppTextStyles.body.copyWith(
                              color: Colors.deepPurple[500],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              final filled = index < state.rating;
                              return IconButton(
                                onPressed: () {
                                  context.read<FeedbackBloc>().add(
                                    FeedbackRatingChanged(index + 1),
                                  );
                                },
                                icon: Icon(
                                  filled ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 32,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'writeYourReviewHere'.tr(),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        context.read<FeedbackBloc>().add(
                          FeedbackTextChanged(text),
                        );
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () {
                          context.read<FeedbackBloc>().add(SubmitFeedback());
                        },
                        child: Text(
                          'submitFeedback'.tr(),
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    /* if (state.submitted)
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        "Thank you for your feedback!",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),*/
                  ],
                ),
              );
            }
            return SizedBox(); // or loading placeholder
          },
        ),
      ),
    );
  }
}
