import '../entities/user_entity.dart';
import '../entities/beneficiary_entity.dart';
import '../entities/transaction_entity.dart';
import '../entities/card_entity.dart';
import '../../data/models/accounts_model.dart';

abstract class HomeRepository {
  Future<User> getUser();
  Future<List<Beneficiary>> getRecentTransfers();
  Future<List<Transaction>> getTransactions();
  Future<List<DemoCard>> getCards();
  Future<AccountsModel> getAccounts({
    required String userId,
    required String loginCode,
    required String accounts,
    required String screen,
  });
} 