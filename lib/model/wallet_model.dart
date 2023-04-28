class WalletModel {
  bool? status;
  String? message;
  Data? data;

  WalletModel({this.status, this.message, this.data});

  WalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? balance;

  Data({this.sId, this.balance});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['balance'] = this.balance;
    return data;
  }
}
