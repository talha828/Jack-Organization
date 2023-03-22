import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';

import '../../../component/constant/constant.dart';
import '../../../component/widgets/jack_textfeild.dart';
import '../../../component/widgets/language_dropdown.dart';
import '../main_screen/main_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool _passwordVisible = false;
  bool _check = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          height: height * 0.9,
          padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.imageSignup,width: width *0.5,height: width * 0.5,),
              CustomTextField(
                prefixImage: Assets.iconEmail,
                suffixImage: Assets.iconAsterisk,
                hintText: 'email'.tr,
                iconColor: appRedColor,
                controller: email,
                width: width,
              ),
              CustomTextField(
                onTap: (){
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                prefixImage: Assets.iconEmail,
                suffixImage:_passwordVisible?Assets.iconHide : Assets.iconView,
                hintText: 'password'.tr,
                iconColor: appRedColor,
                controller: email,
                width: width,
              ),
              Row(
                children: [
                  Checkbox(value: _check, onChanged: (value){
                    setState(() {
                      _check=value!;
                    });
                  }),
                  Text("remember_me".tr,style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                  InkWell(
                      onTap: (){},
                      child: Text("forget_password".tr))
                ],
              ),
              SizedBox(height: width * 0.02,),
              ElevatedButton(onPressed: ()=>Get.to(const MainScreen()), child:Text("login".tr)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("create_a_new_account".tr),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  InkWell(
                      onTap: (){},
                      child: Text(
                        "signup".tr,
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
