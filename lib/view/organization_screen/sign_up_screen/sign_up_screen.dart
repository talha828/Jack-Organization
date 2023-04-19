import 'dart:convert';

import 'package:custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/backend/organization_backend/auth.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/utilities/utilities.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/language_dropdown.dart';
import '../../../component/widgets/loading_indicator.dart';
import '../../../model/errorMessageModel.dart';
import '../../../model/userModel.dart';
import '../otp_verification_screen/otp_verification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController crNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final user = Get.put(GetUserModel());
  GetStorage box = GetStorage();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    String? category = Get.parameters["category"];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "signup".tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: appBlueColor,
              ),
            ),
            actions: [
              LanguageDropDown(width: width),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.04),
              // height: height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(Assets.imageSignup),
                  Column(
                    children: [
                      CustomTextField(
                        prefixImage: Assets.iconProfile,
                        suffixImage: Assets.iconAsterisk,
                        hintText: 'organization_name'.tr,
                        iconColor: appRedColor,
                        controller: name,
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      CustomTextField(
                        prefixImage: Assets.iconCr,
                        suffixImage: Assets.iconAsterisk,
                        hintText: 'cr_number'.tr,
                        iconColor: appRedColor,
                        controller: crNumber,
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      CustomTextField(
                        prefixImage: Assets.iconEmail,
                        suffixImage: Assets.iconAsterisk,
                        hintText: 'email'.tr,
                        iconColor: appRedColor,
                        controller: email,
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      CustomTextField(
                        prefixImage: Assets.iconPhone,
                        suffixImage: Assets.iconAsterisk,
                        hintText: 'phone_number'.tr,
                        iconColor: appRedColor,
                        controller: phone,
                        width: width,
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      CustomTextField(
                        prefixImage: Assets.iconPadlock,
                        suffixImage: Assets.iconAsterisk,
                        hintText: 'password'.tr,
                        iconColor: appRedColor,
                        controller: password,
                        width: width,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width * 0.08,
                  ),
                  ElevatedButton(
                      onPressed: () => Utilities.organizationSignUp(
                          name: name.text,
                          cr: crNumber.text,
                          email: email.text,
                          phoneNumber: phone.text,
                          password: password.text,
                          category: category ?? "gift",
                          width: width,
                          user: user,
                          setLoading: (bool value)=>setState(()=>isLoading=value),
                          box: box),
                      child: Text("create_account".tr)),
                  SizedBox(
                    height: width * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already_a_user".tr),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      InkWell(
                          onTap: ()=>Get.toNamed("/org_login/"),
                          child: Text(
                            "login".tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        isLoading
            ? Positioned.fill(
          child: LoadingIndicator(),
        )
            : Container(),
      ],
    );
  }
}
