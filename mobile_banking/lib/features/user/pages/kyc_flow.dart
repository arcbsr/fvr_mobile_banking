import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moix_app/features/user/pages/upload_face_screen.dart';

import '../kyc_bloc/kyc_bloc.dart';
import '../kyc_bloc/kyc_event.dart';
import '../kyc_bloc/kyc_state.dart';
import '../pages/select_verification_method_screen.dart';
import '../pages/upload_id_screen.dart';

class KycFlow extends StatefulWidget {
  const KycFlow({super.key});

  @override
  State<KycFlow> createState() => _KycFlowState();
}

class _KycFlowState extends State<KycFlow> {
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
    return BlocListener<KycBloc, KycState>(
/*      listenWhen: (previous, current) =>
          previous.currentPage != current.currentPage,*/
      listener: (context, state) async {
        _pageController.animateToPage(
          state.currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );

        print("Kyc status $state.status");
        if (state.status == KycStatus.loading) {
          showDialog(
            context: context,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state.status == KycStatus.success) {
          Navigator.pop(context); // Close loader
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("KYC Successful")));
          await Future.delayed(Duration(milliseconds: 500), () {
            Navigator.of(context).pushReplacementNamed('/main');
          });
        } else if (state.status == KycStatus.failure) {
          Navigator.pop(context); // Close loader
          print("state.message ${state.errorMessage}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("state.message ${state.errorMessage}")),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              final currentPage = context.read<KycBloc>().state.currentPage;
              if (currentPage > 0) {
                context.read<KycBloc>().add(GoToPreviousKycPage());
              } else {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Help?",
                style: TextStyle(color: Colors.deepPurple.shade700),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              SelectVerificationMethodScreen(),
              UploadIdScreen(),
              UploadFaceScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
