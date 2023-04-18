class AddOrderDetails {
  String? rider;
  String? address;
  String? nearestLandmark;
  String? recieverName;
  String? mobile;
  String? orderDetails;
  String? paymentStatus;
  double? latitude;
  double? longitude;

  AddOrderDetails(
      {this.rider,
        this.address,
        this.nearestLandmark,
        this.recieverName,
        this.mobile,
        this.orderDetails,
        this.paymentStatus,
        this.latitude,
        this.longitude});

  AddOrderDetails.fromJson(Map<String, dynamic> json) {
    rider = json['rider'];
    address = json['address'];
    nearestLandmark = json['nearest_landmark'];
    recieverName = json['reciever_name'];
    mobile = json['mobile'];
    orderDetails = json['order_details'];
    paymentStatus = json['PaymentStatus'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rider'] = this.rider;
    data['address'] = this.address;
    data['nearest_landmark'] = this.nearestLandmark;
    data['reciever_name'] = this.recieverName;
    data['mobile'] = this.mobile;
    data['order_details'] = this.orderDetails;
    data['PaymentStatus'] = this.paymentStatus;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
