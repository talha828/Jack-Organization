import 'package:custom_widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/otp_verification_screen/otp_verification.dart';

import '../../../component/constant/constant.dart';
import '../../../component/widgets/add_details_text_fields_screen.dart';
import '../../../component/widgets/language_dropdown.dart';


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

  // Initial Selected Value
  String dropdownvalue = 'Type'.tr;

  // List of items in our dropdown menu
  var items = [
    'Type'.tr,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
              Image.asset(Assets.imageRiderSignUp),
              Column(
                children: [
                  CustomTextField(
                    prefixImage: Assets.iconProfile,
                    suffixImage: Assets.iconAsterisk,
                    hintText: 'name'.tr,
                    iconColor: appRedColor,
                    controller: name,
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
                  Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          iconEnabledColor: appRedColor,
                          value: dropdownvalue,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: width * 0.6,
                          child: AddDetailsTextField(controller: crNumber, maxline: 1, hintText: "Vehicle Number plate".tr, width: width)),
                    ],
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
              ),

            ],
          ),
        ),
      ),
    );
  }
}
