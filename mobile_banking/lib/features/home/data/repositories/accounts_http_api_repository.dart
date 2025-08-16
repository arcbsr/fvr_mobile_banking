import '../../../../core/network/base_api_services.dart';
import '../../../../core/network/network_api_services.dart';
import '../../../../core/utils/app_url.dart';
import '../models/accounts_model.dart';
import 'accounts_api_repository.dart';

class AccountsHttpApiRepository implements AccountsApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<AccountsModel> getAccounts({
    required String userId,
    required String loginCode,
    required String accounts,
    required String screen,
  }) async {
    // Create query parameters
    final queryParams = {
      'userId': userId,
      'loginCode': loginCode,
      'accounts': accounts,
      'screen': screen,
    };

    // Build URL with query parameters
    final uri = Uri.parse(AppUrl.accountsEndpoint).replace(queryParameters: queryParams);
    
    // Make GET request
    dynamic response = await _apiServices.getApi(uri.toString());
    return AccountsModel.fromJson(response);
  }
}
