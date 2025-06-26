import '../../domain/entities/user_entity.dart';
import '../../domain/entities/beneficiary_entity.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/home_repository.dart';
import 'package:flutter/material.dart';

const String kDemoCurrency = 'DZD';

class DemoHomeRepository implements HomeRepository {
  @override
  Future<User> getUser() async {
    return User(
      name: 'Abdullah',
      avatarUrl: 'assets/icons/avatar.png',
      earnAmount: '300 DZD',
      notificationCount: 1,
    );
  }

  @override
  Future<List<Beneficiary>> getRecentTransfers() async {
    return [
      Beneficiary(name: 'Ahmed', avatarUrl: 'assets/icons/avatar.png'),
      Beneficiary(name: 'Sofia', avatarUrl: 'assets/icons/avatar.png'),
      Beneficiary(name: 'Ali', avatarUrl: 'assets/icons/avatar.png'),
      Beneficiary(name: 'Hamlin', avatarUrl: 'assets/icons/avatar.png'),
      Beneficiary(name: 'Mark', avatarUrl: 'assets/icons/avatar.png'),
    ];
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return [
      Transaction(title: 'Walmart', date: 'Today', time: '12:32', amount: '-35.23 DZD', isCredit: false, logoUrl: 'assets/icons/logo_walmart.png'),
      Transaction(title: 'Top Up', date: 'Yesterday', time: '12:32', amount: '+430.00 DZD', isCredit: true, logoUrl: 'assets/icons/logo_walmart.png'),
      Transaction(title: 'Netflix', date: 'Dec 24', time: '12:32', amount: '-35.23 DZD', isCredit: false, logoUrl: 'assets/icons/logo_walmart.png'),
      Transaction(title: 'Top Up', date: '24 Jan', time: '12:32', amount: '+1,504.00 DZD', isCredit: true, logoUrl: 'assets/icons/logo_walmart.png'),
    ];
  }

  @override
  Future<List<DemoCard>> getCards() async {
    return [
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Visa',
        maskedNumber: '**** 1234',
        expiry: '12/26',
        gradient: const LinearGradient(
          colors: [Color(0xFF270685), Color(0xFF5732BF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        cardholderName: 'Abdullah Mahmud',
        balance: '14,235.21',
        currency: kDemoCurrency,
        cvv: '123',
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Mastercard',
        maskedNumber: '**** 5678',
        expiry: '09/25',
        gradient: const LinearGradient(
          colors: [Color(0xFF4DA66B), Color(0xFF6F45E9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        cardholderName: 'Sofia Rahman',
        balance: '8,900.00',
        currency: kDemoCurrency,
        cvv: '456',
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Amex',
        maskedNumber: '**** 9012',
        expiry: '03/27',
        gradient: const LinearGradient(
          colors: [Color(0xFF191970), Color(0xFF00BFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        cardholderName: 'Ali Hamlin',
        balance: '2,500.50',
        currency: kDemoCurrency,
        cvv: '789',
      ),
      DemoCard(
        logo: 'assets/icons/ic_card_logo.png',
        type: 'Discover',
        maskedNumber: '**** 3456',
        expiry: '11/28',
        gradient: const LinearGradient(
          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        cardholderName: 'Mark Benson',
        balance: '5,100.00',
        currency: kDemoCurrency,
        cvv: '321',
      ),
    ];
  }
} 