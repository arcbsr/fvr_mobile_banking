import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/image_picker_helper.dart';
import '../kyc_bloc/kyc_bloc.dart';
import '../kyc_bloc/kyc_event.dart';

class UploadIdScreen extends StatelessWidget {
  const UploadIdScreen({super.key});

  Future<void> _handlePickImage(BuildContext context) async {
    final paths = await ImagePickerHelper.pickImages(context, onlyCamera: true);
    for (var path in paths) {
      context.read<KycBloc>().add(UploadIdImage(side: "front", filePath: path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<KycBloc>().state;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Upload Clear Images of Your Identity Card’s",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          GestureDetector(
            onTap: () => _handlePickImage(context),
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, color: Colors.deepPurple),
                    SizedBox(height: 8),
                    Text("ID Front side"),
                    Text(
                      "Click here to capture or select images (max size 2MB each)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (state.idOrPassportImageList.isNotEmpty)
            Container(
              height: 204.h,
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                itemCount: state.idOrPassportImageList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    // change value for more/less rounding
                    child: Image.file(
                      state.idOrPassportImageList[index],
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),

          const Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: (state.idOrPassportImageList.isNotEmpty)
                ? () {
                    context.read<KycBloc>().add(GoToNextKycPage());
                  }
                : null,
            child: Text(
              "Continue",
              style: AppTextStyles.title.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
