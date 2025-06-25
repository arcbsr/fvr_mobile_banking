import '../entities/user_entity.dart';
import '../entities/beneficiary_entity.dart';
import '../entities/transaction_entity.dart';
import '../entities/card_entity.dart';

abstract class HomeRepository {
  Future<User> getUser();
  Future<List<Beneficiary>> getRecentTransfers();
  Future<List<Transaction>> getTransactions();
  Future<List<DemoCard>> getCards();
} 