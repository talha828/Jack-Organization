import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/GetXModel/GetUserModel.dart';
import 'package:jack_delivery/backend/organization_backend/backend.dart';
import 'package:jack_delivery/helper/helper.dart';

import '../GetXModel/GetOrderDetailsModel.dart';
import '../backend/organization_backend/auth.dart';
import '../model/add_order_details_model.dart';
import '../model/errorMessageModel.dart';
import '../model/userModel.dart';

class Utilities {

  static organizationSignUp(
      {required String name,
      required String cr,
      required String email,
      required String phoneNumber,
      required String password,
      required String category,
      required double width,
      required GetUserModel user,
      required var setLoading,
      required GetStorage box}) async {
    setLoading(true);
    int index = validation(
        name: name,
        email: email,
        password: password,
        cr: cr,
        phoneNumber: phoneNumber);
    if (index == -1) {
      var response = await Auth.signUp(
          name: name,
          crNumber: cr,
          email: email,
          phoneNumber: phoneNumber,
          category: category,
          password: password);
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        user.user.value = UserModel.fromJson(data);

        box.write("email", email);
        box.write("password", password);
        box.write("user_type", "organization");
        box.write("userId", user.user.value.user!.sId);
        Get.toNamed("/org_otp_verify/");
        Get.snackbar("Verify Your Email", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
        setLoading(false);
      } else {
        setLoading(false);
        Get.snackbar("Something went wrong", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      setLoading(false);
      Get.snackbar(
        error[index].title,
        error[index].subtitle,
        margin: EdgeInsets.symmetric(
            vertical: width * 0.05, horizontal: width * 0.04),
      );
    }
  }

  static int validation(
      {required String name,
      required String cr,
      required String email,
      required String phoneNumber,
      required String password}) {
    if (name.isEmpty) return 0;
    if (cr.isEmpty) return 1;
    if (!GetUtils.isEmail(email)) return 2;
    if (!GetUtils.isPhoneNumber(phoneNumber)) return 3;
    if (!regExp.hasMatch(password)) return 4;
    return -1;
  }

  static organizationLogin({
    required String email,
    required String password,
    required var setLoading,
    required double width,
    required GetUserModel user,
    required GetStorage box,
  }) async {
    int index = loginValidation(email: email, password: password);

    if (index == -1) {
      setLoading(true);
      var response = await Auth.login(email: email, password: password);
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        user.user.value = UserModel.fromJson(data);
        box.write("email", email);
        box.write("password", password);
        box.write("user_type", "organization");
        box.write("userId", user.user.value.user!.sId);
        Get.toNamed("/org_main/");
        setLoading(false);
      } else {
        setLoading(false);
        Get.snackbar("Something went wrong", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      setLoading(false);

      Get.snackbar(
        error[index].title,
        error[index].subtitle,
        margin: EdgeInsets.symmetric(
            vertical: width * 0.05, horizontal: width * 0.04),
      );
    }
  }

  static riderLogin({
    required String email,
    required String password,
    required var setLoading,
    required double width,
    required GetUserModel user,
    required GetStorage box,
  }) async {
    int index = loginValidation(email: email, password: password);

    if (index == -1) {
      setLoading(true);
      var response = await Auth.login(email: email, password: password);
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        user.user.value = UserModel.fromJson(data);
        box.write("email", email);
        box.write("password", password);
        box.write("user_type", "rider");
        box.write("userId", user.user.value.user!.sId);
        Get.toNamed("/rider_main/");
        setLoading(false);
      } else {
        setLoading(false);
        Get.snackbar("Something went wrong", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      setLoading(false);

      Get.snackbar(
        error[index].title,
        error[index].subtitle,
        margin: EdgeInsets.symmetric(
            vertical: width * 0.05, horizontal: width * 0.04),
      );
    }
  }

  static int loginValidation(
      {required String email, required String password}) {
    if (!GetUtils.isEmail(email)) return 2;
    if (!regExp.hasMatch(password)) return 4;
    return -1;
  }

  static postOrderDetails(
      {required String name,
      required String number,
      required String address,
      required String landmark,
      required String details,
      required String status,
      required String lat,
      required GetOrderDetailsModel order,
      required String long,
      required double width,
      required setLoading,
      required String token}) async {
    int index = postOrderValidation(
        name: name,
        number: number,
        address: address,
        landmark: landmark,
        details: details,
        status: status,
        lat: lat,
        long: long,
        token: token);

    if (index == -1) {
      setLoading(true);
      await Geolocator.requestPermission();
      Position location = await Geolocator.getCurrentPosition();
      order.order.value = AddOrderDetails(
        rider: name,
        mobile: number,
        address: address,
        nearestLandmark: landmark,
        orderDetails: details,
        paymentStatus: status,
        latitude: location.latitude,
        longitude: location.longitude,
      );
      var response = await BackEnd.postOrder(
              name: name,
              number: number,
              address: address,
              landmark: landmark,
              details: details,
              status: status,
              lat: location.latitude.toString(),
              long: location.longitude.toString(),
              token: token)
          .catchError((e) {
        setLoading(false);
        print(e.toString());
      });
      var data = jsonDecode(response.body);
      print(data.toString());
      if (response.statusCode == 200) {
        setLoading(false);
        Get.snackbar("Congratulation", "Your order post successfully",
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
        Get.toNamed("org_looking_for_rider");
      } else {
        setLoading(false);
        Get.snackbar("Something went wrong", "Please try again",
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      Get.snackbar("Something went wrong", "Please Fill All the details",
          margin: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.04));
    }
  }

  static int postOrderValidation(
      {required String name,
      required String number,
      required String address,
      required String landmark,
      required String details,
      required String status,
      required String lat,
      required String long,
      required String token}) {
    if (name.isEmpty) return 2;
    if (number.isEmpty) return 3;
    if (address.isEmpty) return 3;
    if (landmark.isEmpty) return 3;
    if (details.isEmpty) return 3;
    if (status.isEmpty) return 3;
    if (lat.isEmpty) return 3;
    if (long.isEmpty) return 3;
    if (token.isEmpty) return 3;
    return -1;
  }



  //rider
  static riderSignUp(
      {required String name,
        required String numberPlate,
        required String email,
        required String phoneNumber,
        required String password,
        required double width,
        required GetUserModel user,
        required var setLoading,
        required GetStorage box}) async {
    setLoading(true);
    int index = validation(
        name: name,
        email: email,
        password: password,
        cr: numberPlate,
        phoneNumber: phoneNumber);
    if (index == -1) {
      var response = await Auth.riderSignUp(
          name: name,
          numberPlate: numberPlate,
          email: email,
          phoneNumber: phoneNumber,
          password: password);
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        user.user.value = UserModel.fromJson(data);

        box.write("email", email);
        box.write("password", password);
        box.write("user_type", "rider");
        box.write("userId", user.user.value.user!.sId);
        Get.toNamed("/rider_otp_verify/");
        Get.snackbar("Verify Your Email", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
        setLoading(false);
      } else {
        setLoading(false);
        Get.snackbar("Something went wrong", data['message'].toString(),
            margin: EdgeInsets.symmetric(
                vertical: width * 0.05, horizontal: width * 0.04));
      }
    } else {
      setLoading(false);
      Get.snackbar(
        error[index].title,
        error[index].subtitle,
        margin: EdgeInsets.symmetric(
            vertical: width * 0.05, horizontal: width * 0.04),
      );
    }
  }

}
