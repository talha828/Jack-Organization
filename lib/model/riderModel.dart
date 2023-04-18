class RiderModel {
  String? sId;
  String? riderName;
  String? organizationName;
  String? crNumber;
  String? vehiclenumberplate;
  String? email;
  String? password;
  String? profilePhoto;
  String? mobile;
  String? token;
  bool? verified;
  int? balance;
  String? category;
  String? createdAt;
  int? iV;

  RiderModel(
      {this.sId,
        this.riderName,
        this.organizationName,
        this.crNumber,
        this.vehiclenumberplate,
        this.email,
        this.password,
        this.profilePhoto,
        this.mobile,
        this.token,
        this.verified,
        this.balance,
        this.category,
        this.createdAt,
        this.iV});

  RiderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    riderName = json['riderName'];
    organizationName = json['organizationName'];
    crNumber = json['crNumber'];
    vehiclenumberplate = json['vehiclenumberplate'];
    email = json['email'];
    password = json['password'];
    profilePhoto = json['profilePhoto'];
    mobile = json['mobile'];
    token = json['token'];
    verified = json['verified'];
    balance = json['balance'];
    category = json['category'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['riderName'] = this.riderName;
    data['organizationName'] = this.organizationName;
    data['crNumber'] = this.crNumber;
    data['vehiclenumberplate'] = this.vehiclenumberplate;
    data['email'] = this.email;
    data['password'] = this.password;
    data['profilePhoto'] = this.profilePhoto;
    data['mobile'] = this.mobile;
    data['token'] = this.token;
    data['verified'] = this.verified;
    data['balance'] = this.balance;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
