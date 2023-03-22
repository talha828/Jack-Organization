import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';

import '../../../component/constant/constant.dart';
import '../../../component/widgets/jack_textfeild.dart';
import '../../../component/widgets/language_dropdown.dart';
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          height: height * 0.9,
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
                ],
              ),
              ElevatedButton(
                  onPressed: ()=>Get.to(const OtpVerificationScreen()), child: Text("create_account".tr)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already_a_user".tr),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  InkWell(
                      onTap: (){},
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
    );
  }
}
