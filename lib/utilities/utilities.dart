import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/GetXModel/GetUserModel.dart';

import '../backend/organization_backend/auth.dart';
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
    List<ErrorMessage> error = [
      ErrorMessage(
          title: "Please Enter a Name", subtitle: "Please must provide a name"),
      ErrorMessage(
          title: "Please Enter Cr number",
          subtitle: "Please must provide a name"),
      ErrorMessage(
          title: "Please Enter a valid email",
          subtitle: "Please must provide a valid email"),
      ErrorMessage(
          title: "Phone Number is incorrect",
          subtitle: "Please must provide a valid Phone Number (+923012070920)"),
      ErrorMessage(
          title: "Your password is not valid",
          subtitle:
              "Password should contain upper,lower,digit and Special character"),
    ];
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
        box.write("token", user.user.value.user!.token);
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
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (name.isEmpty) return 0;
    if (!GetUtils.isNum(cr)) return 1;
    if (!GetUtils.isEmail(email)) return 2;
    if (!GetUtils.isPhoneNumber(phoneNumber)) return 3;
    if (!regExp.hasMatch(password)) return 4;
    return -1;
  }
}
