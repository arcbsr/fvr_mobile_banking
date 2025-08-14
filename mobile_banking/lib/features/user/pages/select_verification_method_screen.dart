import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../kyc_bloc/kyc_bloc.dart';
import '../kyc_bloc/kyc_event.dart';

class SelectVerificationMethodScreen extends StatelessWidget {
  const SelectVerificationMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<KycBloc>().state;

    Widget buildMethodButton(String title, String method) {
      final isSelected = state.selectedMethod == method;
      return GestureDetector(
        onTap: () {
          context.read<KycBloc>().add(SelectVerificationMethod(method));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? Colors.deepPurple : Colors.grey.shade300),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Icon(Icons.badge,
                  color: isSelected ? Colors.deepPurple : Colors.grey),
              const SizedBox(width: 12),
              Text(title),
              const Spacer(),
              Icon(Icons.keyboard_arrow_right,
                  color: isSelected ? Colors.deepPurple : Colors.grey),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select your Verification Method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Your Identity data will be deleted within 30 days from our database",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          buildMethodButton("National ID / Driver license", "id"),
          buildMethodButton("Passport", "passport"),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: state.selectedMethod != null
                ? () {
              context.read<KycBloc>().add(GoToNextKycPage());
            }
                : null,
            child: Text("Continue", style: AppTextStyles.title.copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
            )),
          ),
        ],
      ),
    );
  }
}
