import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moix_app/features/login/pages/address_screen.dart';
import 'package:moix_app/features/login/pages/password_screen.dart';
import 'package:moix_app/features/login/pages/terms_conditions_screen.dart';

import '../signup_block/signup_bloc.dart';
import '../signup_block/signup_event.dart';
import '../signup_block/signup_state.dart';
import 'Basic_Info_Screen.dart';
import 'dob_screen.dart';

class SignupFlow extends StatefulWidget {
  const SignupFlow({super.key});

  @override
  State<SignupFlow> createState() => _SignupFlowState();
}

class _SignupFlowState extends State<SignupFlow> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listenWhen: (previous, current) => previous.currentPage != current.currentPage,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              final currentPage = context.read<SignupBloc>().state.currentPage;
              if (currentPage > 0) {
                context.read<SignupBloc>().add(GoToPreviousPage());
              } else {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text("Help?", style: TextStyle(color: Colors.purple.shade700)),
            ),
          ],
          elevation: 0,
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            BasicInfoScreen(),
            DobScreen(),
            AddressScreen(),
            PasswordScreen(),
            TermsConditionsScreen(),
          ],
        ),
      ),
    );
  }
}

/*
class SignupFlow extends StatefulWidget {
  const SignupFlow({super.key});

  @override
  State<SignupFlow> createState() => _SignupFlowState();
}

class _SignupFlowState extends State<SignupFlow> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

  *//*  return Provider<SignupBloc>(
      create: (_) => SignupBloc(),
      child: MaterialApp(
        home: SignupFlow(),
      ),
    );*//*

    return BlocProvider(
      create: (_) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) => previous.currentPage != current.currentPage,
        listener: (context, state) {
          _pageController.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                final currentPage = context.read<SignupBloc>().state.currentPage;
                if (currentPage > 0) {
                  context.read<SignupBloc>().add(GoToPreviousPage());
                }
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text("Help?", style: TextStyle(color: Colors.purple.shade700)),
              ),
            ],
            elevation: 0,
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              BasicInfoScreen(),
              DobScreen(),
            ],
          ),
        ),
      ),
    );
  }
}*/
/*
class SignupFlow extends StatelessWidget {
  const SignupFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return BlocProvider(
      create: (_) => SignupBloc(),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          controller.jumpToPage(state.currentPage); // move to current page on state update

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (state.currentPage > 0) {
                    context.read<SignupBloc>().add(GoToPreviousPage());
                  }
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("Help?", style: TextStyle(color: Colors.purple.shade700)),
                )
              ],
              elevation: 0,
            ),
            body: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                BasicInfoScreen(),
                DobScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/
