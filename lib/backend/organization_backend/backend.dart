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
      required var token}) async {
    if (otp != null || otp!.length > 5){
      setLoading(true);
      print(otp);
      Uri url = Uri.parse("$directory/api/verify-email");
      var response = await http.post(url, body:{"otp": otp} , headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
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
}
