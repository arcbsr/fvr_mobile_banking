import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/image_picker_helper.dart';
import '../../../core/utils/shared_preferences_helper.dart';
import '../kyc_bloc/kyc_bloc.dart';
import '../kyc_bloc/kyc_event.dart';

class UploadFaceScreen extends StatelessWidget {
  const UploadFaceScreen({super.key});

  Future<void> _handlePickImage(BuildContext context) async {
    final paths = await ImagePickerHelper.pickImages(context, onlyCamera: true);
    for (var path in paths) {
      context.read<KycBloc>().add(
        UploadFaceImage(side: "front", filePath: path),
      );
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
          SizedBox(height: 10.h),

          GestureDetector(
            onTap: () => _handlePickImage(context),
            child: SizedBox(
              height: 200.h,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/camera_face.png',
                      // Add your own image asset
                      height: 120,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Face Verification",
                      style: AppTextStyles.header.copyWith(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    Text(
                      "Your face will be scanned to verify your identity when signing in.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (state.faceImage != null)
            Container(
              height: 204.h,
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                // change value for more/less rounding
                child: Image.file(
                  state.faceImage!,
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),

          const Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: state.faceImage != null
                ? () async {
                    context.read<KycBloc>().add(
                      KycRequestSubmitted(
                        userId: await SharedPreferencesHelper().getUserId(),
                        loginCode: await SharedPreferencesHelper()
                            .getLoginCode(),
                        id_type: state.selectedMethod!,
                        address_doc_type: "test",
                        identification_document:
                            state.idOrPassportImageList.first,
                        address_document: state.faceImage!,
                        face_verification_image: state.faceImage!,
                      ),
                    );
                    // context.read<KycBloc>().add(GoToNextKycPage());
                  }
                : null,
            child: Text(
              "Proceed",
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
