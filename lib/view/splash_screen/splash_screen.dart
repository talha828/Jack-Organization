import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/terms_and_condition_screen/terms_and_condition_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), ()=>Get.to(const TermsAndConditionScreen()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0,end: 1),
          duration:const Duration(seconds: 2),
          builder: (context,value,child){
            return Padding(
              padding: EdgeInsets.symmetric(vertical:width * (value/10)),
              child: Opacity(opacity: value ,child: child,),
            );
          },
          curve: Curves.linear,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(Assets.imageLogo,width: width * 0.5,height: width,scale: 2,),
                Column(
                  children: [
                    Image.asset(Assets.imageLogoNameEnglish),
                    SizedBox(height: width * 0.05,),
                    Image.asset(Assets.imageLogoNameArbic),
                  ],
                ),
                SizedBox(height: width * 0.05,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
