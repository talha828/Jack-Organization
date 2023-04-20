import 'dart:convert';

import 'package:custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/GetXModel/GetUserModel.dart';
import 'package:jack_delivery/backend/organization_backend/auth.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/utilities/utilities.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/language_dropdown.dart';
import '../../../component/widgets/loading_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = false;
  bool _check = true;
  bool isLoading = false;
  final user = Get.put(GetUserModel());
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "login".tr,
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
                height: height * 0.9,
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.imageRiderSignUp,
                      width: width * 0.5,
                      height: width * 0.5,
                    ),
                    CustomTextField(
                      prefixImage: Assets.iconEmail,
                      suffixImage: Assets.iconAsterisk,
                      hintText: 'email'.tr,
                      iconColor: appRedColor,
                      controller: email,
                      width: width,
                    ),
                    CustomTextField(
                      onTapSuffix: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      prefixImage: Assets.iconEmail,
                      suffixImage:
                          _passwordVisible ? Assets.iconHide : Assets.iconView,
                      hintText: 'password'.tr,
                      iconColor: appRedColor,
                      controller: password,
                      width: width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: _check,
                                onChanged: (value) {
                                  setState(() {
                                    _check = value!;
                                  });
                                }),
                            Text(
                              "remember_me".tr,
                              style: textBold,
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () async {
                              if (email.text.isNotEmpty &&
                                  GetUtils.isEmail(email.text)) {
                                var response = await Auth.forgetPassword(
                                    email: email.text);
                                var data = jsonDecode(response.body);
                                if (data['success'] == true) {
                                  Get.snackbar("Please check your email",
                                      data['msg'].toString(),
                                      margin: EdgeInsets.symmetric(
                                          vertical: width * 0.05,
                                          horizontal: width * 0.04));
                                } else {
                                  Get.snackbar("Something went wrong",
                                      data['msg'].toString(),
                                      margin: EdgeInsets.symmetric(
                                          vertical: width * 0.05,
                                          horizontal: width * 0.04));
                                }
                              } else {
                                Get.snackbar("Invalid Email",
                                    "Please input a valid email",
                                    margin: EdgeInsets.symmetric(
                                        vertical: width * 0.05,
                                        horizontal: width * 0.04));
                              }
                            },
                            child: Text("forget_password".tr))
                      ],
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    ElevatedButton(
                        onPressed: () => Utilities.riderLogin(
                              email: email.text,
                              setLoading: (bool value) => setState(() {
                                isLoading = value;
                              }),
                              password: password.text,
                              width: width,
                              user: user,
                              box: box,
                            ),
                        child: Text("login".tr)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("create_a_new_account".tr),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        InkWell(
                            onTap: () => Get.toNamed('/rider_sign_up/'),
                            child: Text(
                              "signup".tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
