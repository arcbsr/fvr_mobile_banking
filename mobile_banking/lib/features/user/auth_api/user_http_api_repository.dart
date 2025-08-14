import 'package:moix_app/features/user/model/user_kyc.dart';

import '../../../core/network/base_api_services.dart';
import '../../../core/network/network_api_services.dart';
import '../../../core/utils/app_url.dart';
import 'user_api_repository.dart';

class UserHttpApiRepository implements UserApiRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  @override
  Future<UserKyc> userKyc(data) async {
    // TODO: implement verificationStatus

    dynamic response = await _apiServices.postApi(AppUrl.userKyc, data);
    return UserKyc.fromJson(response);
  }
}
