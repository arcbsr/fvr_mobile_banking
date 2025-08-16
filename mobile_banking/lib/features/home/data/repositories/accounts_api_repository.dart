import '../models/accounts_model.dart';

abstract class AccountsApiRepository {
  Future<AccountsModel> getAccounts({
    required String userId,
    required String loginCode,
    required String accounts,
    required String screen,
  });
}
