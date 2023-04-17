import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jack_delivery/helper/helper.dart';

class BackEnd {
  static otpVerification(
      {String? otp,
      required double width,
      required var setLoading,
      required var userId}) async {
    if (otp != null || otp!.length > 5) {
      setLoading(true);
      print(otp);
      Uri url = Uri.parse("$directory/api/verify-email");
      var response = await http.post(url, body: {"otp": otp, "userId": userId});
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        setLoading(false);
        Get.toNamed("/org_main/");
      } else {
        setLoading(false);
        Get.snackbar("Otp Verification fail", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      setLoading(false);
      Get.snackbar("Otp Verification fail", "Please provide a valid opt",
          margin: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.04));
    }
  }

  static getOrder() async {
    Uri url = Uri.parse("https://jackdelivery-full-backend.onrender.com/api/orders");
    print("url getOrders:https://jackdelivery-full-backend.onrender.com/api/orders");
    var response =
        await http.get(url);
    return response;
  }

  static Future postOrder(
      {required String name,
      required String number,
      required String address,
      required String landmark,
      required String details,
      required String status,
      required String lat,
      required String long,
      required String token}) async {
    Uri url =
        Uri.parse("https://jackdelivery-full-backend.onrender.com/api/create");
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "rider": "643a4e4b390abd440758579a",  // YAHA RIDER KHI ID HAAY GEE //
      "address": address,
      "nearest_landmark": landmark,
      "reciever_name": name,
      "mobile": number,
      "order_details": details,
      "PaymentStatus": status,
      "latitude": lat.toString(),   //Yeha latitude number ayegah//
      "longitude": long.toString()
    });
    var data=jsonDecode(utf8.decode(response.bodyBytes));
    print(data.toString());
    return response;
  }
}
