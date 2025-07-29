/*
// File: signup_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../signup_block/signup_state.dart';

class SignupScreen extends StatelessWidget {
  final PageController _controller = PageController();

  SignupScreen({super.key});

  final List<Widget> pages = const [
    SignupInfoPage(),
    DOBPage(),
    AddressPage(),
    SetPasswordPage(),
    TermsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          _controller.animateToPage(
            state.step,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Scaffold(
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
        ),
      ),
    );
  }
}

// Below are placeholder widgets for each step:
class SignupInfoPage extends StatelessWidget {
  const SignupInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Signup Info Page"),
          ElevatedButton(
            onPressed: () => context.read<SignupBloc>().add(NextStep()),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class DOBPage extends StatelessWidget {
  const DOBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("DOB Page"),
          ElevatedButton(
            onPressed: () => context.read<SignupBloc>().add(NextStep()),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Address Page"),
          ElevatedButton(
            onPressed: () => context.read<SignupBloc>().add(NextStep()),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Set Password Page"),
          ElevatedButton(
            onPressed: () => context.read<SignupBloc>().add(NextStep()),
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Terms and Conditions Page"),
        ],
      ),
    );
  }
}*/
