class GetOrderModel {
  bool? success;
  int? count;
  List<Data>? data;

  GetOrderModel({this.success, this.count, this.data});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['success'] = success;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Location? location;
  String? sId;
  Rider? rider;
  String? address;
  String? nearestLandmark;
  String? recieverName;
  String? mobile;
  String? orderDetails;
  String? paymentStatus;
  String? orderstatus;
  String? createdAt;
  int? iV;

  Data(
      {this.location,
        this.sId,
        this.rider,
        this.address,
        this.nearestLandmark,
        this.recieverName,
        this.mobile,
        this.orderDetails,
        this.paymentStatus,
        this.orderstatus,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    rider = json['rider'] != null ?  Rider.fromJson(json['rider']) : null;
    address = json['address'];
    nearestLandmark = json['nearest_landmark'];
    recieverName = json['reciever_name'];
    mobile = json['mobile'];
    orderDetails = json['order_details'];
    paymentStatus = json['PaymentStatus'];
    orderstatus = json['Orderstatus'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    if (rider != null) {
      data['rider'] = rider!.toJson();
    }
    data['address'] =address;
    data['nearest_landmark'] =nearestLandmark;
    data['reciever_name'] = recieverName;
    data['mobile'] = mobile;
    data['order_details'] = orderDetails;
    data['PaymentStatus'] = paymentStatus;
    data['Orderstatus'] = orderstatus;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Rider {
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

  Rider(
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

  Rider.fromJson(Map<String, dynamic> json) {
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
