import 'package:flutter/material.dart';

class User {
  final String name;
  final String avatarUrl;
  User({required this.name, required this.avatarUrl});
}

class Transaction {
  final String title;
  final String date;
  final String time;
  final String amount;
  final bool isCredit;
  final String logoUrl;
  Transaction({required this.title, required this.date, required this.time, required this.amount, required this.isCredit, required this.logoUrl});
}

class Beneficiary {
  final String name;
  final String avatarUrl;
  Beneficiary({required this.name, required this.avatarUrl});
}

class DemoCard {
  final String logo;
  final String type;
  final String maskedNumber;
  final String expiry;
  final Gradient gradient;
  DemoCard({required this.logo, required this.type, required this.maskedNumber, required this.expiry, required this.gradient});
} 