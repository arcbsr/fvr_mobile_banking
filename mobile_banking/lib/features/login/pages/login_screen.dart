import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moix_app/features/login/pages/signup_flow.dart';

import '../../../core/theme/app_theme.dart';
import '../../../dependency_injection/locator.dart';
import '../login_bloc/auth_bloc.dart';
import '../login_bloc/auth_event.dart';
import '../login_bloc/auth_state.dart';
import '../signup_block/signup_bloc.dart';
import '../widget/custom_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String countryCode = "+213";
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(authApiRepository: getIt()),
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is AuthLoading) {
              showDialog(
                context: context,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else if (state is AuthSuccess) {
              // print("User: ${state.user.data}");
              print("KYC Verified: ${state.kycVerified}");
              Navigator.pop(context); // Close loader
              if (state.kycVerified) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Successful")),
                );
                await Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.of(context).pushReplacementNamed('/main');
                });
              } else {
                Navigator.of(context).pushNamed('/kyc_verification_page');
               }
            } else if (state is AuthFailure) {
              Navigator.pop(context); // Close loader
              print("state.message ${state.message}");
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome to Mobix",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Enter your Mobile Number",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Tab Bar
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.deepPurple,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.deepPurple,
                        tabs: const [
                          Tab(text: "Phone Number"),
                          Tab(text: "Email Address"),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // TabBar View (Switch between Phone & Email)
                      SizedBox(
                        height: 80,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Phone Input
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  DropdownButton<String>(
                                    value: countryCode,
                                    items: ["+213", "+880", "+91"].map((code) {
                                      return DropdownMenuItem(
                                        value: code,
                                        child: Text(code),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        countryCode = value!;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: phoneController,
                                      decoration: const InputDecoration(
                                        hintText: "Enter phone number",
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Email Input
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  hintText: "Enter email address",
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomInputField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                        suffixIcon: Icons.visibility,
                      ),
                      //LabeledInputField( label: 'Password', controller: passwordController),
                      const SizedBox(height: 8),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: AppTextStyles.title.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            final password = passwordController.text.trim();

                            if (_tabController.index == 0) {
                              final phone =
                                  countryCode + phoneController.text.trim();
                              /* context.read<AuthBloc>().add(
                                PhoneLoginSubmitted(
                                  phone: phone,
                                  password: password,
                                ),
                              );*/
                            } else {
                              final email = emailController.text.trim();
                              context.read<AuthBloc>().add(
                                PhoneLoginSubmitted(
                                  email: email,
                                  password: password,
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Continue",
                            style: AppTextStyles.title.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                        ),
                      ),
                      //const Spacer(),

                      // Sign Up
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (_) =>
                                      SignupBloc(authApiRepository: getIt()),
                                  child: const SignupFlow(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyles.title.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
