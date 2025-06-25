class Transaction {
  final String title;
  final String date;
  final String time;
  final String amount;
  final bool isCredit;
  final String logoUrl;
  Transaction({required this.title, required this.date, required this.time, required this.amount, required this.isCredit, required this.logoUrl});
} 