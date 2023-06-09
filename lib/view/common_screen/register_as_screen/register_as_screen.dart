import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/component/widgets/language_dropdown.dart';
import 'package:jack_delivery/component/widgets/registrationButton.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/login_screen/login_screen.dart' as login;
import '../../organization_screen/login_screen/login_screen.dart';

import '../../organization_screen/organization_category_screen/organization_category_screen.dart';
import '../../rider_screen/sign_up_screen/sign_up_screen.dart';

class RegisterAsScreen extends StatefulWidget {
  const RegisterAsScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAsScreen> createState() => _RegisterAsScreenState();
}

class _RegisterAsScreenState extends State<RegisterAsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "register_as".tr,
            style:const TextStyle(fontWeight: FontWeight.bold, color: appBlueColor),
          ),
          leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: appBlueColor,
            ),
          ),
          actions: [
            LanguageDropDown(width: width),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                RegistrationButton(onTap: (){Get.toNamed("/org_category/");}, width: width, image: Assets.imageVector, title: "Organization".tr),
                RegistrationButton(scale:10,onTap:(){Get.to(const SignUpScreen());}, width: width, image: Assets.imageBicycle, title: "Rider".tr)
              ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("already_user".tr,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: width * 0.04,),
                  Text("login_to_your_account".tr,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: width * 0.04,),
                  Container(padding: EdgeInsets.symmetric(horizontal: width * 0.235), child: const Divider(color: appYellowColor,thickness: 2,),),
                  SizedBox(height: width * 0.04,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imageRight,scale: 25,),
                      SizedBox(width: width * 0.04,),
                      InkWell(
                          onTap: ()=>Get.to(const LoginScreen()),
                          child: Text("Organization".tr,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(height:width * 0.04 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imageRight,scale: 25,),
                      SizedBox(width: width * 0.04,),
                      InkWell(
                          onTap: ()=>Get.to(const login.LoginScreen()),
                          child: Text("${"Rider".tr}            ",textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              )
           ],
          ),
        ),
      ),
    );
  }
}
