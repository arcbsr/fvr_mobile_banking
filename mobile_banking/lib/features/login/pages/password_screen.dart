import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../widget/labeled_input_field.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});
  final List<String> country = const [
    'India',
    'Bangladesh',
    'England'
  ];
  final List<String> stateAddress = const [
    'test1',
    'test2',
    'test3'
  ];
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Set Password", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("Your password must have minimum 8 characters including 1 upper case, 1 lower case, 1 digit and atleast 1 special character."),
          const SizedBox(height: 20),
          LabeledInputField(
            label: 'Password',
            obscureText: true,
            showToggle: true,
            onChanged: (v) => bloc.add(UpdatePassword(v)),
          ),
          const SizedBox(height: 16),
          LabeledInputField(
            label: 'Confirm Password',
            obscureText: true,
            showToggle: true,
            onChanged: (v) => bloc.add(UpdateConfirmPassword(v)),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () => bloc.add(GoToNextPage()),
              child: Text("Continue",style: AppTextStyles.title.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onPrimary,
              )),
            ),
          ),
        ],
      ),
    );
  }
}