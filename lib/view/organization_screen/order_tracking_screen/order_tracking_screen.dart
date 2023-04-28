import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/model/get_order_model.dart';
import 'package:jack_delivery/model/riderModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../backend/organization_backend/backend.dart';
import '../../../component/widgets/add_details_text_fields_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final user = Get.find<GetUserModel>();
  Data? data;
  GetOrderModel? order;
  getOrderDetails() async {
    var response = await BackEnd.getOrder();
    var data = jsonDecode(response.body);
    if (data['success'] == true) {
      order = GetOrderModel.fromJson(data);
      // List<Data> dd= order!.data!;
      // order!.data!.clear();
      // for(var i in dd){
      //   if(i.sId == user.user.value.user!.sId){
      //     order!.data!.add(i);
      //   }
      // }
      print(user.user.value.user!.token);
      setState(() {});
    } else {
      Get.snackbar("Something went wrong", "Please load you screen again",
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15));
    }
  }

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    getOrderDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: appBlueColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text("Order Tracking"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04, horizontal: width * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Reciver Name",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    AddDetailsTextField(
                        controller: _controller,
                        maxline: 1,
                        hintText: "Type Here",
                        width: width),
                    SizedBox(
                      height: width * 0.05,
                    ),
                    ElevatedButton(
                        onPressed: ()async{
                          if(order != null){
                          int index=  order!.data!.indexWhere((element) => element.recieverName!.contains(_controller.text));
                          setState(() {
                            data=order!.data![index];
                          });
                          }
                        }, child: const Text("Track Order")),
                  ],
                ),
                SizedBox(height: width * 0.2,),
                data==null?Container():Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: width * 0.04,),
                        Container(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: SizedBox(
                            height: width * 0.3,
                            child: const VerticalDivider(
                              thickness: 2,
                              color: appRedColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: SizedBox(
                            height: width * 0.3,
                            child: const VerticalDivider(
                              thickness: 2,
                              color: appRedColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: width * 0.03),
                          child: SizedBox(
                            height: width * 0.15,
                            child: const VerticalDivider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // first step
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: appRedColor,
                              child: Image.asset(Assets.iconPin),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order dispatched",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                Text("Order dispatched from ${data!.nearestLandmark}"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.05,),
                        // second step
                        Row(
                          children: [

                            Padding(
                                padding: EdgeInsets.only(left: width * 0.03),
                                child: CircleAvatar(
                                  backgroundColor: appRedColor,
                                  radius: width * 0.02,
                                )),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order Received",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                const Text("Received by"),

                                // second Step
                                Container(
                                  decoration: BoxDecoration(
                                  color: appBlackColor,
                                    borderRadius: BorderRadius.circular(width * 0.02)
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: width * 0.04,
                                      horizontal: width * 0.04),
                                  margin: EdgeInsets.symmetric(
                                      vertical: width * 0.02,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(
                                              data!.rider!.profilePhoto!,
                                              width: width * 0.15,
                                              height: width * 0.15,
                                            )),
                                      ),
                                      SizedBox(
                                        width: width * 0.04,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data!.rider!.riderName!,
                                            style:const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            data!.rider!.mobile!,
                                            style:const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.04,
                                      ),
                                      SizedBox(
                                        width: width * 0.24,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap:()=>makeCall(),
                                              child: CircleAvatar(
                                                radius: width * 0.05,
                                                backgroundColor: Colors.white,
                                                child: Image.asset(
                                                  Assets.iconPhoneCall,
                                                  scale: 25,
                                                  color: appRedColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.04,
                                            ),
                                            InkWell(
                                              onTap: ()=>sendMessage(),
                                              child: CircleAvatar(
                                                radius: width * 0.05,
                                                backgroundColor: Colors.white,
                                                child: Image.asset(
                                                  Assets.iconChat,
                                                  scale: 25,
                                                  color: appRedColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.05,),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: width * 0.03),
                              child: CircleAvatar(
                                backgroundColor: appRedColor,
                                radius: width * 0.02,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.07,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order in delivery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                const Text("Order is in delivery, will reach in 10 mins"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.05,),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Image.asset(Assets.iconCheckMark,scale: 25,color: Colors.white,),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  "DropOff",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04),
                                ),
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                const Text("Order successfully delivered"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                )
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  sendMessage() async {
    // Android
    String uri = 'sms:${data!.rider!.mobile}?body=hello';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      String uri = 'sms:${data!.rider!.mobile}?body=hello';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  makeCall() async {
    // Android
    String uri = 'tel://${data!.rider!.mobile}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      String uri = 'tel://${data!.rider!.mobile}';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}
