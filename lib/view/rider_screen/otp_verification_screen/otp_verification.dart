import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../backend/organization_backend/backend.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/language_dropdown.dart';
import '../../../component/widgets/loading_indicator.dart';
import '../login_screen/login_screen.dart';



class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController(),);
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode(),);
  String? otp;
  bool isLoading=false;
  GetStorage box= GetStorage();


  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                  "opt_verification".tr,
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
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.05, horizontal: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "please_enter_6_digits".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(Assets.imageVerification,width: width * 0.5,height: width * 0.6,),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 45,
                        fieldWidth: 45,
                        disabledColor: Colors.white,
                        inactiveColor: Colors.grey.withOpacity(0.4),
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration:const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          otp = value.toString();
                        });
                      },
                      appContext: context,
                    ),
                    InkWell(
                      onTap: ()=>Get.back(),
                      child: Text(
                        "change_number".tr,
                        textAlign: TextAlign.center,
                        style:const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: ()=>BackEnd.otpVerificationForRider(otp:otp! , width: width,setLoading: (bool value)=>setState(()=>isLoading=value),userId:box.read("userId") ), child: Text("confirm".tr)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("receive_code".tr),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        InkWell(
                            onTap: ()=>Get.back(),
                            child: Text(
                              "resend".tr,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            isLoading
                ? Positioned.fill(
              child: LoadingIndicator(),
            )
                : Container(),
          ],
        ));
  }
}
