import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../../dependency_injection/locator.dart';
import '../../user/kyc_bloc/kyc_bloc.dart';
import '../../user/pages/kyc_flow.dart';

class KycVerificationPage extends StatelessWidget {
  const KycVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Back button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 20),

                // Rejected Icon Image
                Image.asset(
                  'assets/icons/rejected.png', // Add your own image asset
                  height: 140,
                ),

                const SizedBox(height: 16),

                // Unfortunately! text
                const Text(
                  "Unfortunately!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // KYC Rejected Text
                const Text(
                  "Your KYC has been\nRejected",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                // Reason Box
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reason:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Identification Document Reason: You Id is not Clear\n"
                        "Address Document Reason: Upload a new one",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // RE-KYC button
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => KycBloc(userApiRepository: getIt()),
                            child: const KycFlow(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "RE - KYC",
                      style: AppTextStyles.title.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // const Spacer(),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  // Handle logout
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.deepPurple, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "Logout",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moix_app/features/login/login_bloc/auth_state.dart';

import '../login_bloc/auth_bloc.dart';

class KycVerificationPage extends StatelessWidget {
  const KycVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        */
/*  if (state == AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("KYC Approved!")),
              );
            }*/ /*

      },
      builder: (context, state) {
        */
/* if (state == VerificationStateLoading) {
              return Center(child: CircularProgressIndicator());
            }*/ /*


        //if (state == KycVerificationStatus) {
        return WillPopScope(
          onWillPop: () async {
            return true; // allow pop
          },
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close_rounded, size: 80, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    "Unfortunately!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your KYC has been Rejected",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reason:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        //Text("Identification Document Reason: ${state.idReason}"),
                        //Text("Address Document Reason: ${state.addressReason}"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                    ),
                    onPressed: () {
                      // Trigger RE-KYC flow
                    },
                    child: Text(
                      "RE - KYC",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Logout action
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

      //}

      //return Container();
    );
  }
}
*/
