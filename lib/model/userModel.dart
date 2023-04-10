class UserModel {
  bool? success;
  String? message;
  User? user;

  UserModel({this.success, this.message, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? password;
  String? mobile;
  bool? verified;
  String? riderName;
  String? organizationName;
  String? crNumber;
  String? vehiclenumberplate;
  String? profilePhoto;
  String? token;

  User(
      {this.sId,
        this.email,
        this.password,
        this.mobile,
        this.verified,
        this.riderName,
        this.organizationName,
        this.crNumber,
        this.vehiclenumberplate,
        this.profilePhoto,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    mobile = json['mobile'];
    verified = json['verified'];
    riderName = json['riderName'];
    organizationName = json['organizationName'];
    crNumber = json['crNumber'];
    vehiclenumberplate = json['vehiclenumberplate'];
    profilePhoto = json['profilePhoto'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['email'] = email;
    data['password'] = password;
    data['mobile'] = mobile;
    data['verified'] = verified;
    data['riderName'] = riderName;
    data['organizationName'] = organizationName;
    data['crNumber'] = crNumber;
    data['vehiclenumberplate'] = vehiclenumberplate;
    data['profilePhoto'] = profilePhoto;
    data['token'] = token;
    return data;
  }
}
