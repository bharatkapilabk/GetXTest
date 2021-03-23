// To parse this JSON data, do
//
//     final loginResp = loginRespFromJson(jsonString);

import 'dart:convert';

LoginResp loginRespFromJson(String str) => LoginResp.fromJson(json.decode(str));

String loginRespToJson(LoginResp data) => json.encode(data.toJson());

class LoginResp {
  LoginResp({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  List<Result> result;

  factory LoginResp.fromJson(Map<String, dynamic> json) => LoginResp(
    status: json["status"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.legalFirstName,
    this.legalLastName,
    this.email,
    this.password,
    this.pin,
    this.phone,
    this.citizenship,
    this.dob,
    this.gender,
    this.maritialStatus,
    this.noOfDependent,
    this.expectedIncomePy,
    this.photoIdType,
    this.numberOfId,
    this.idPhoto,
    this.profilePhoto,
    this.userQr,
    this.currentWalletAmount,
    this.rememberToken,
    this.type,
    this.userType,
    this.code,
    this.emailCode,
    this.status,
    this.verifyStatus,
    this.kycStatus,
    this.signupStatus,
    this.deletedStatus,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  dynamic legalFirstName;
  dynamic legalLastName;
  dynamic email;
  dynamic password;
  String pin;
  String phone;
  dynamic citizenship;
  dynamic dob;
  dynamic gender;
  dynamic maritialStatus;
  dynamic noOfDependent;
  dynamic expectedIncomePy;
  dynamic photoIdType;
  dynamic numberOfId;
  dynamic idPhoto;
  dynamic profilePhoto;
  dynamic userQr;
  dynamic currentWalletAmount;
  dynamic rememberToken;
  String type;
  String userType;
  dynamic code;
  dynamic emailCode;
  String status;
  String verifyStatus;
  String kycStatus;
  String signupStatus;
  String deletedStatus;
  String deviceToken;
  DateTime createdAt;
  dynamic updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    legalFirstName: json["legal_first_name"],
    legalLastName: json["legal_last_name"],
    email: json["email"],
    password: json["password"],
    pin: json["pin"],
    phone: json["phone"],
    citizenship: json["citizenship"],
    dob: json["dob"],
    gender: json["gender"],
    maritialStatus: json["maritial_status"],
    noOfDependent: json["no_of_dependent"],
    expectedIncomePy: json["expected_income_py"],
    photoIdType: json["photo_id_type"],
    numberOfId: json["number_of_id"],
    idPhoto: json["id_photo"],
    profilePhoto: json["profile_photo"],
    userQr: json["user_qr"],
    currentWalletAmount: json["current_wallet_amount"],
    rememberToken: json["remember_token"],
    type: json["type"],
    userType: json["user_type"],
    code: json["code"],
    emailCode: json["email_code"],
    status: json["status"],
    verifyStatus: json["verify_status"],
    kycStatus: json["kyc_status"],
    signupStatus: json["signup_status"],
    deletedStatus: json["deleted_status"],
    deviceToken: json["device_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "legal_first_name": legalFirstName,
    "legal_last_name": legalLastName,
    "email": email,
    "password": password,
    "pin": pin,
    "phone": phone,
    "citizenship": citizenship,
    "dob": dob,
    "gender": gender,
    "maritial_status": maritialStatus,
    "no_of_dependent": noOfDependent,
    "expected_income_py": expectedIncomePy,
    "photo_id_type": photoIdType,
    "number_of_id": numberOfId,
    "id_photo": idPhoto,
    "profile_photo": profilePhoto,
    "user_qr": userQr,
    "current_wallet_amount": currentWalletAmount,
    "remember_token": rememberToken,
    "type": type,
    "user_type": userType,
    "code": code,
    "email_code": emailCode,
    "status": status,
    "verify_status": verifyStatus,
    "kyc_status": kycStatus,
    "signup_status": signupStatus,
    "deleted_status": deletedStatus,
    "device_token": deviceToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
  };
}
