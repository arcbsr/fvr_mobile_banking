import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';

class DobScreen extends StatelessWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Date of Birth", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("You must be 18+ to join Mobix"),
          const SizedBox(height: 24),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                bloc.add(UpdateDob(picked));
              }
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: "Date of Birth",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(state.dob != null
                  ? "${state.dob!.day}/${state.dob!.month}/${state.dob!.year}"
                  : "Select your birth date"),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                 bloc.add(GoToNextPage());
              },
              child:  Text("Continue",style: AppTextStyles.title.copyWith(
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
