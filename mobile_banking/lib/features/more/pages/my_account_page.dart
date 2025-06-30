import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = context.read<SettingsBloc>().state;
    if (user is MyAccountState) {
      _usernameController.text = user.user.name??"";
      _fullNameController.text = user.user.fullName??"";
      _dobController.text = user.user.dob??"";
      _phoneController.text = user.user.phoneNumber??"";
      _emailController.text = user.user.email??"";
      _addressController.text = user.user.address??"";
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is UpdatePersonalInfoSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated")),
          );
          Navigator.pop(context);
          context.read<SettingsBloc>().add(LoadSettings());
        } else if (state is UpdatePersonalInfoFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        Navigator.pop(context);
        context.read<SettingsBloc>().add(LoadSettings());
      },
      builder: (context, state) {
        final isLoading = state is UpdatingPersonalInfo;

        return WillPopScope(
          onWillPop: () async {
            context.read<SettingsBloc>().add(
              LoadSettings(),
            ); // reset before pop
            return true; // allow pop
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              //title: Text('deleteAccount'.tr()),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildField("Username", _usernameController),
                  _buildField("Full Name", _fullNameController),
                  _buildDatePickerField("Date of Birth", _dobController),
                  _buildField("Phone Number", _phoneController),
                  _buildField("Email Address", _emailController),
                  _buildField("Address", _addressController),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                      context.read<SettingsBloc>().add(UpdatePersonalInfo(
                        name: _usernameController.text,
                        fullName: _fullNameController.text,
                        dob: _dobController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Confirm & Send"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _buildDatePickerField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime(1990),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            controller.text = "${date.day} ${_monthName(date.month)} ${date.year}";
          }
        },
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }
}