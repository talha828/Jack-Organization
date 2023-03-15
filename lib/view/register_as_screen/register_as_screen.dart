import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/organization_screen/organization_screen.dart';

import '../../components/constant/constant.dart';
import '../../components/widgets/language_dropdown.dart';
import '../../components/widgets/registrationButton.dart';
import '../terms_and_condition_screen/terms_and_condition_screen.dart';

class RegisterAsScreen extends StatefulWidget {
  const RegisterAsScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAsScreen> createState() => _RegisterAsScreenState();
}

class _RegisterAsScreenState extends State<RegisterAsScreen> {
  String title="Organization";
  String image="Organization";
  var onTap=(){};
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
          title: const Text(
            "Register As",
            style: TextStyle(fontWeight: FontWeight.bold, color: appBlueColor),
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
                RegistrationButton(onTap: (){Get.to(const OrganizationScreen());}, width: width, image: Assets.imageVector, title: "Organization"),
                RegistrationButton(scale:10,onTap: onTap, width: width, image: Assets.imageBicycle, title: "Rider")
              ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Already a user?",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: width * 0.04,),
                  const Text("Login To your Account",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: width * 0.04,),
                  Container(padding: EdgeInsets.symmetric(horizontal: width * 0.235), child: const Divider(color: appYellowColor,thickness: 2,)),
                  SizedBox(height: width * 0.04,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imageRight,scale: 25,),
                      SizedBox(width: width * 0.04,),
                      const Text("Organization",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height:width * 0.04 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imageRight,scale: 25,),
                      SizedBox(width: width * 0.04,),
                      const Text("Rider            ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
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
