import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../GetXModel/GetUserModel.dart';
import '../../../component/constant/constant.dart';
import '../../../model/wallet_model.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  TextEditingController controller = TextEditingController();
  double balance = 0.0;

  getWallet() async {
    Uri url =
        Uri.parse("https://jackdelivery-full-backend.onrender.com/api/total");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${user.user.value.user!.token!}',
    });
    var data = jsonDecode(response.body);
    print(data.toString());
    if (response.statusCode == 200) {
      WalletModel wallet = WalletModel.fromJson(data);
      balance = wallet.data!.balance!.toDouble();
      setState(() {});
    } else {
      Get.snackbar("Something went wrong", "Please load you screen again",
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15));
    }
  }

  final user = Get.find<GetUserModel>();

  @override
  void initState() {
    getWallet();
    super.initState();
  }

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
                            balance.toString(),
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
            SizedBox(
              height: width * 0.5,
            ),
            ElevatedButton(
                onPressed: () async {
                  Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: width * 0.04, horizontal: width * 0.04),
                      height: width * 0.6,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Enter Your Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05),
                          ),
                          const Divider(),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Amount',
                              hintText: "100",
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if(controller.text.isNotEmpty){
                                  Uri url=Uri.parse("https://jackdelivery-full-backend.onrender.com/api/balance");
                                  var response = await http.put(url,headers: {
                                    'Content-Type': 'application/json',
                                    'Authorization': 'Bearer ${user.user.value.user!.token!}',
                                  },body: json.encode({"balance":controller.text.toString()}));
                                  var data=jsonDecode(response.body);
                                  print(data.toString());
                                  getWallet();
                                  Get.back();
                                }else{
                                  Get.back();
                                }
                              },
                              child: const Text("Submit"))
                        ],
                      ),
                    ),
                  );
                  // Uri url=Uri.parse("https://jackdelivery-full-backend.onrender.com/api/payment/process");
                  //  var response= await http.post(url,body:{
                  //    "amount":"100",
                  //  },headers: {'Authorization': 'Bearer ${user.user.value.user!.token!}',});
                },
                child: Text("recharge_wallet".tr)),
            // Text(
            //   "withdraw".tr,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // )
          ],
        ),
      ),
    ));
  }
}
