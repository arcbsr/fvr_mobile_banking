import '../models/demo_models.dart';

final demoUser = User(name: 'Abdullah', avatarUrl: 'assets/icons/avatar.png');

final demoBeneficiaries = [
  Beneficiary(name: 'Ahmed', avatarUrl: 'assets/icons/avatar.png'),
  Beneficiary(name: 'Sofia', avatarUrl: 'assets/icons/avatar.png'),
  Beneficiary(name: 'Ali', avatarUrl: 'assets/icons/avatar.png'),
  Beneficiary(name: 'Hamlin', avatarUrl: 'assets/icons/avatar.png'),
  Beneficiary(name: 'Mark', avatarUrl: 'assets/icons/avatar.png'),
  // Add more demo beneficiaries as needed
];

final demoTransactions = [
  Transaction(title: 'Walmart', date: 'Today', time: '12:32', amount: '-35.23 DZD', isCredit: false, logoUrl: 'assets/icons/logo_walmart.png'),
  Transaction(title: 'Top Up', date: 'Yesterday', time: '12:32', amount: '+430.00 DZD', isCredit: true, logoUrl: 'assets/icons/logo_walmart.png'),
  Transaction(title: 'Netflix', date: 'Dec 24', time: '12:32', amount: '-35.23 DZD', isCredit: false, logoUrl: 'assets/icons/logo_walmart.png'),
  Transaction(title: 'Top Up', date: '24 Jan', time: '12:32', amount: '+1,504.00 DZD', isCredit: true, logoUrl: 'assets/icons/logo_walmart.png'),
]; 