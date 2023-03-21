import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/constant/constant.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: appBlueColor,
            )),
        centerTitle: true,
        title: Text("wallet".tr),
        // actions: [
        //   LanguageDropDown(width: width),
        // ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.04),
              height: width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-2, 2),
                        blurRadius: 7,
                        spreadRadius: 5,
                        color: Colors.grey.withOpacity(0.2)),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "wallet_balances".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "400.00",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appYellowColor,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.07),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "BHD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: width * 0.5,),
            ElevatedButton(onPressed: (){}, child: Text("recharge_wallet".tr)),
            Text("withdraw".tr,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    ));
  }
}
