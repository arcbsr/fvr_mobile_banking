// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? accountType;
  String? email;
  String? firstName;
  String? isKycVerified;
  bool? isLoggedIn;
  DateTime? lastLogin;
  String? lastName;
  String? loginCode;
  String? loginTime;
  dynamic mobile;
  String? ppic;
  String? referralCode;
  String? role;
  String? roleText;
  String? shortUserId;
  bool? topupActivation;
  String? uid;
  String? userId;
  String? userName;

  Data({
    this.accountType,
    this.email,
    this.firstName,
    this.isKycVerified,
    this.isLoggedIn,
    this.lastLogin,
    this.lastName,
    this.loginCode,
    this.loginTime,
    this.mobile,
    this.ppic,
    this.referralCode,
    this.role,
    this.roleText,
    this.shortUserId,
    this.topupActivation,
    this.uid,
    this.userId,
    this.userName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accountType: json["account_type"],
    email: json["email"],
    firstName: json["first_name"],
    isKycVerified: json["is_kyc_verified"],
    isLoggedIn: json["is_logged_in"],
    lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
    lastName: json["last_name"],
    loginCode: json["login_code"],
    loginTime: json["login_time"],
    mobile: json["mobile"],
    ppic: json["ppic"],
    referralCode: json["referral_code"],
    role: json["role"],
    roleText: json["role_text"],
    shortUserId: json["short_user_id"],
    topupActivation: json["topup_activation"],
    uid: json["uid"],
    userId: json["user_id"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "account_type": accountType,
    "email": email,
    "first_name": firstName,
    "is_kyc_verified": isKycVerified,
    "is_logged_in": isLoggedIn,
    "last_login": lastLogin?.toIso8601String(),
    "last_name": lastName,
    "login_code": loginCode,
    "login_time": loginTime,
    "mobile": mobile,
    "ppic": ppic,
    "referral_code": referralCode,
    "role": role,
    "role_text": roleText,
    "short_user_id": shortUserId,
    "topup_activation": topupActivation,
    "uid": uid,
    "user_id": userId,
    "user_name": userName,
  };
}
