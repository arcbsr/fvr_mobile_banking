import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../signup_block/signup_state.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;
    return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Terms & Conditions",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text(
                    "Please read and accept our terms and conditions.",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                CheckboxListTile(
                  value: state.selectedTermsOption == TermsOption.none,
                  onChanged: (_) {
                    bloc.add(SelectTermsOption(TermsOption.none));
                  },
                  title: RichText(
                    text: TextSpan(
                      text: "By signing up you are agreeing with the ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "General Agreement",
                          style: const TextStyle(color: Colors.blue),
                          // Add recognizer if using GestureRecognizer
                        ),
                        const TextSpan(text: ", "),
                        TextSpan(
                          text: "Usage Rules",
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 8),
                CheckboxListTile(
                  value: state.selectedTermsOption == TermsOption.notifyOnUpdates,
                  onChanged: (_) {
                    bloc.add(SelectTermsOption(TermsOption.notifyOnUpdates));
                  },
                  title: const Text("Notify On Account Updates"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  value:
                  state.selectedTermsOption == TermsOption.notifyAboutUpdates,
                  onChanged: (_) {
                    bloc.add(SelectTermsOption(TermsOption.notifyAboutUpdates));
                  },
                  title: const Text("Notify About Account Updates"),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size.fromHeight(50)),

                  onPressed: () {
                    bloc.add(SignUpRequestSubmitted(email: state.email, gender: state.gender,
                    first_name: state.firstName, last_name: state.lastName, user_name: state.username,
                    account_type: "0", country_id: state.selectedCountry, state_id: state.selectedState,
                    day: state.dob?.day??1, month: state.dob?.month??1, year: state.dob?.year??1990 ));
                  },
                  //onPressed: () => bloc.add(GoToNextPage()),
                  /*onPressed: state.agreedToTerms
                      ? () {
                    bloc.add(GoToNextPage());
                  }
                      : null,*/
                  child: Text("Continue",style: AppTextStyles.title.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary,
                  )),
                ),
              ],
            ),
          );
  }
}