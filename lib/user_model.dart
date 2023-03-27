class UserData {
  UserData._privateConstructor();

  factory UserData() {
    return _instance;
  }
  static final UserData _instance = UserData._privateConstructor();

  UserModel user = UserModel();
}

class UserModel {
  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Data({this.accessToken, this.tokenType, this.expiresIn, this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  UserDetails? userDetails;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken ?? '';
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  UserDetails({
    this.pkIntUserId,
    this.vchrUserName,
    this.email,
    this.countrycode,
    this.intRoleId,
    this.mobile,
    this.vchrUserMobile,
    this.isWoo,
    this.outgoingCallingMethod,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    pkIntUserId = json['pk_int_user_id'];
    vchrUserName = json['vchr_user_name'];
    email = json['email'];
    countrycode = json['countrycode'];
    intRoleId = json['int_role_id'];
    mobile = json['mobile'];
    vchrUserMobile = json['vchr_user_mobile'];
    isWoo = json['is_woo'];
    outgoingCallingMethod = json['outgoing_calling_method'];
  }
  int? pkIntUserId;
  String? vchrUserName;
  String? email;
  int? countrycode;
  int? intRoleId;
  String? mobile;
  String? vchrUserMobile;
  int? isWoo;
  int? outgoingCallingMethod;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk_int_user_id'] = pkIntUserId;
    data['vchr_user_name'] = vchrUserName;
    data['email'] = email;
    data['countrycode'] = countrycode;
    data['int_role_id'] = intRoleId;
    data['mobile'] = mobile;
    data['vchr_user_mobile'] = vchrUserMobile;
    data['is_woo'] = isWoo;
    data['outgoing_calling_method'] = outgoingCallingMethod;
    return data;
  }
}
