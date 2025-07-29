import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../../../login/pages/signup_flow.dart';
import '../../../login/signup_block/signup_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB3E5FC), Color(0xFF81D4FA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/ic_logo_mobix.png', // Update this path to your Mobix logo asset
            width: 180.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
} 