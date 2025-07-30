import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../widget/labeled_input_field.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController userNameController;
  late TextEditingController emailNameController;
  late TextEditingController referralCodeController;

  @override
  void initState() {
    super.initState();
    final state = context.read<SignupBloc>().state;
    firstNameController = TextEditingController(text: state.firstName);
    lastNameController = TextEditingController(text: state.lastName);
    userNameController = TextEditingController(text: state.username);
    emailNameController = TextEditingController(text: state.email);
    referralCodeController = TextEditingController(text: state.referralCode);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailNameController.dispose();
    referralCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.read<SignupBloc>().state;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text("Let's start with some basic info"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    label: 'First Name',
                    controller: firstNameController,
                    onChanged: (v) => bloc.add(UpdateFirstName(v)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: LabeledInputField(
                    label: 'Last Name',
                    controller: lastNameController,
                    onChanged: (v) => bloc.add(UpdateLastName(v)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LabeledInputField(
              label: 'Username',
              controller: userNameController,
              onChanged: (v) => bloc.add(UpdateUsername(v)),
            ),
            const SizedBox(height: 16),
            LabeledInputField(
              label: 'Email Address',
              controller: emailNameController,
              onChanged: (v) => bloc.add(UpdateEmail(v)),
            ),
            const SizedBox(height: 16),
            GenderDropdown(
              selectedGender: state.gender,
              onChanged: (gender) {
                if (gender != null) {
                  bloc.add(UpdateGender(gender));
                }
              },
            ),
            const SizedBox(height: 16),
            LabeledInputField(
              label: 'Referral Code (optional)',
              controller: referralCodeController,
              onChanged: (v) => bloc.add(UpdateReferralCode(v)),
            ),
            //const Spacer(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () => bloc.add(GoToNextPage()),
                child: Text(
                  "Continue",
                  style: AppTextStyles.title.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // const Center(child: Text("by 🟡🟥🟢 Tetra")),
          ],
        ),
      ),
    );
  }
}

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?>? onChanged;

  const GenderDropdown({
    super.key,
    this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender?.isNotEmpty == true ? selectedGender : null,
      onChanged: onChanged,
      decoration: const InputDecoration(
        labelText: "Select Gender",
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(value: 'male', child: Text("Male")),
        DropdownMenuItem(value: 'female', child: Text("Female")),
        DropdownMenuItem(value: 'other', child: Text("Other")),
      ],
    );
  }
}
