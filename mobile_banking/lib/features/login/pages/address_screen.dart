import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../widget/labeled_input_field.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreen();
}

class _AddressScreen extends State<AddressScreen> {
  late TextEditingController streetAddressController;
  late TextEditingController zipCodeController;

  @override
  void initState() {
    super.initState();
    final state = context.read<SignupBloc>().state;
    streetAddressController = TextEditingController(text: state.streetAddress);
    zipCodeController = TextEditingController(text: state.zipCode);
  }

  @override
  void dispose() {
    streetAddressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }
  final Map<int, String> countryMap = {
    1: 'India',
    2: 'Bangladesh',
    3: 'England',
  };
  final Map<int, String> stateMap = {
    1: 'test1',
    2: 'test2',
    3: 'test3',
  };

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignupBloc>();
    final state = context.watch<SignupBloc>().state;
    return SingleChildScrollView(
      child: Padding(
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Country',
              ),
              value: state.selectedCountry.isEmpty ? null : state.selectedCountry,
              items: countryMap.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key.toString(),
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  bloc.add(CountrySelected(value)); // Send selected ID to Bloc
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select State',
              ),
              value: state.selectedState.isEmpty ? null : state.selectedState,
              items: stateMap.entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.key.toString(),
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  bloc.add(StateSelected(value)); // Send selected ID to Bloc
                }
              },
            ),
          /*  DropdownButtonFormField<String>(
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
            ),*/
            const SizedBox(height: 16),
            LabeledInputField(
              label: 'Street Address',
              controller: streetAddressController,
              onChanged: (v) => bloc.add(UpdateStreetAddress(v)),
            ),
            const SizedBox(height: 16),
            LabeledInputField(
              label: 'Zip Code',
              controller: zipCodeController,
              onChanged: (v) => bloc.add(UpdateZipCode(v)),
            ),
            // const Spacer(),
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
          ],
        ),
      ),
    );
  }
}
