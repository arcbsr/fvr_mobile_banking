import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../widget/labeled_input_field.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  final List<String> country = const ['India', 'Bangladesh', 'England'];
  final List<String> stateAddress = const ['test1', 'test2', 'test3'];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Address",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text("Enter country and state"),
          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Select Country',
            ),
            value: state.selectedCountry.isEmpty ? null : state.selectedCountry,
            items: country
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                bloc.add(CountrySelected(value));
              }
            },
          ),
          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Select State',
            ),
            value: state.selectedState.isEmpty ? null : state.selectedState,
            items: stateAddress
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                context.read<SignupBloc>().add(StateSelected(value));
              }
            },
          ),
          const SizedBox(height: 16),
          /* TextField(
            decoration: const InputDecoration(labelText: "Street Address"),
            onChanged: (v) => bloc.add(UpdateStreetAddress(v)),
          ),*/
          LabeledInputField(
            label: 'Street Address',
            onChanged: (v) => bloc.add(UpdateStreetAddress(v)),
          ),
          const SizedBox(height: 16),
          /* TextField(
            decoration: const InputDecoration(labelText: "Zip Code"),
            onChanged: (v) => bloc.add(UpdateZipCode(v)),
          ),*/
          LabeledInputField(
            label: 'Zip Code',
            onChanged: (v) => bloc.add(UpdateZipCode(v)),
          ),
          const Spacer(),
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
        ],
      ),
    );
  }
}
