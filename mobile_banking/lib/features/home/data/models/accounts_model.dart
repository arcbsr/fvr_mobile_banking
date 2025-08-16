class AccountsModel {
  final bool? status;
  final int? isSmileVerified;
  final String? userName;
  final String? mobile;
  final int? isKycVerified;
  final String? profileImageUrl;
  final int? totalBalance;
  final bool? businessStatus;
  final List<Account>? data;

  AccountsModel({
    this.status,
    this.isSmileVerified,
    this.userName,
    this.mobile,
    this.isKycVerified,
    this.profileImageUrl,
    this.totalBalance,
    this.businessStatus,
    this.data,
  });

  factory AccountsModel.fromJson(Map<String, dynamic> json) {
    return AccountsModel(
      status: json['status'],
      isSmileVerified: _parseInt(json['is_smile_verified']),
      userName: json['user_name'],
      mobile: json['mobile'],
      isKycVerified: _parseInt(json['is_kyc_verified']),
      profileImageUrl: json['profile_image_url'],
      totalBalance: _parseInt(json['total_balance']),
      businessStatus: json['business_status'],
      data: json['data'] != null
          ? List<Account>.from(json['data'].map((x) => Account.fromJson(x)))
          : null,
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'is_smile_verified': isSmileVerified,
      'user_name': userName,
      'mobile': mobile,
      'is_kyc_verified': isKycVerified,
      'profile_image_url': profileImageUrl,
      'total_balance': totalBalance,
      'business_status': businessStatus,
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class Account {
  final String? id;
  final String? accountIdHash;
  final String? accountNo;
  final int? accountType;
  final int? categoryId;
  final String? storeName;
  final int? docType;
  final String? document;
  final String? rejectedDocument;
  final String? docDescription;
  final String? userId;
  final int? isDisable;
  final String? rejectionReasonId;
  final int? isBlock;
  final int? isActivated;
  final int? isFreeze;
  final int? cardPin;
  final String? lastTimePinGenerated;
  final String? mobile;
  final String? residencyAddress;
  final double? accountBalance;
  final double? deliveryFee;
  final double? issueFee;
  final String? createdDtm;
  final int? cvv;
  final String? expiryDt;
  final String? manufacturedDt;
  final int? bRequest;
  final String? bcreatedDtm;
  final String? bcreatedBy;
  final String? bApprovedDtm;
  final int? bApprovedBy;
  final String? activatedDt;
  final int? createdBy;
  final int? balance;

  Account({
    this.id,
    this.accountIdHash,
    this.accountNo,
    this.accountType,
    this.categoryId,
    this.storeName,
    this.docType,
    this.document,
    this.rejectedDocument,
    this.docDescription,
    this.userId,
    this.isDisable,
    this.rejectionReasonId,
    this.isBlock,
    this.isActivated,
    this.isFreeze,
    this.cardPin,
    this.lastTimePinGenerated,
    this.mobile,
    this.residencyAddress,
    this.accountBalance,
    this.deliveryFee,
    this.issueFee,
    this.createdDtm,
    this.cvv,
    this.expiryDt,
    this.manufacturedDt,
    this.bRequest,
    this.bcreatedDtm,
    this.bcreatedBy,
    this.bApprovedDtm,
    this.bApprovedBy,
    this.activatedDt,
    this.createdBy,
    this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      accountIdHash: json['accountIdHash'],
      accountNo: json['accountNo'],
      accountType: _parseInt(json['accountType']),
      categoryId: _parseInt(json['categoryId']),
      storeName: json['storeName'],
      docType: _parseInt(json['docType']),
      document: json['document'],
      rejectedDocument: json['rejectedDocument'],
      docDescription: json['docDescription'],
      userId: json['userId'],
      isDisable: _parseInt(json['isDisable']),
      rejectionReasonId: json['rejection_reason_id'],
      isBlock: _parseInt(json['isBlock']),
      isActivated: _parseInt(json['isActivated']),
      isFreeze: _parseInt(json['isFreeze']),
      cardPin: _parseInt(json['cardPin']),
      lastTimePinGenerated: json['lastTimePinGenerated'],
      mobile: json['mobile'],
      residencyAddress: json['residencyAddress'],
      accountBalance: _parseDouble(json['account_balance']),
      deliveryFee: _parseDouble(json['delivery_fee']),
      issueFee: _parseDouble(json['issue_fee']),
      createdDtm: json['createdDtm'],
      cvv: _parseInt(json['cvv']),
      expiryDt: json['expiryDt'],
      manufacturedDt: json['manufacturedDt'],
      bRequest: _parseInt(json['bRequest']),
      bcreatedDtm: json['bcreatedDtm'],
      bcreatedBy: json['bcreatedBy'],
      bApprovedDtm: json['bApprovedDtm'],
      bApprovedBy: _parseInt(json['bApprovedBy']),
      activatedDt: json['activatedDt'],
      createdBy: _parseInt(json['createdBy']),
      balance: _parseInt(json['balance']),
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'accountIdHash': accountIdHash,
      'accountNo': accountNo,
      'accountType': accountType,
      'categoryId': categoryId,
      'storeName': storeName,
      'docType': docType,
      'document': document,
      'rejectedDocument': rejectedDocument,
      'docDescription': docDescription,
      'userId': userId,
      'isDisable': isDisable,
      'rejection_reason_id': rejectionReasonId,
      'isBlock': isBlock,
      'isActivated': isActivated,
      'isFreeze': isFreeze,
      'cardPin': cardPin,
      'lastTimePinGenerated': lastTimePinGenerated,
      'mobile': mobile,
      'residencyAddress': residencyAddress,
      'account_balance': accountBalance,
      'delivery_fee': deliveryFee,
      'issue_fee': issueFee,
      'createdDtm': createdDtm,
      'cvv': cvv,
      'expiryDt': expiryDt,
      'manufacturedDt': manufacturedDt,
      'bRequest': bRequest,
      'bcreatedDtm': bcreatedDtm,
      'bcreatedBy': bcreatedBy,
      'bApprovedDtm': bApprovedDtm,
      'bApprovedBy': bApprovedBy,
      'activatedDt': activatedDt,
      'createdBy': createdBy,
      'balance': balance,
    };
  }
}
