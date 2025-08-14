/**
 * Created by Mahfuz
 * 14th Aug 2025
 **/

//import 'package:moix_app/features/user/model/kyc_verification_status.dart';

import 'package:moix_app/features/user/model/user_kyc.dart';

/// Abstract class defining methods for authentication API repositories.
abstract class UserApiRepository {
  /// Sends a login request to the authentication API with the provided [data].
  ///
  /// Returns a [UserModel] representing the user data if the login is successful.
  // Future<KycVerificationStatus> verificationStatus(dynamic data);
   Future<UserKyc> userKyc(dynamic data);
}