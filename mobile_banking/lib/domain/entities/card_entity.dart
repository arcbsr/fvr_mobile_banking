import 'package:flutter/material.dart';

class DemoCard {
  final String logo;
  final String type;
  final String maskedNumber;
  final String expiry;
  final Gradient gradient;
  final String cardholderName;
  final String balance;
  final String currency;
  final String cvv;
  DemoCard({
    required this.logo,
    required this.type,
    required this.maskedNumber,
    required this.expiry,
    required this.gradient,
    required this.cardholderName,
    required this.balance,
    required this.currency,
    required this.cvv,
  });
} 