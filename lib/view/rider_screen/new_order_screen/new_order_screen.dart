import 'dart:convert';

import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/backend/organization_backend/backend.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/drawer_screen/drawer_screen.dart';
import 'package:jack_delivery/view/rider_screen/new_order_accept_screen/new_order_accept_screen.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../model/get_order_model.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  GetOrderModel? order;
  final user = Get.find<GetUserModel>();
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
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () => Get.to(const DrawerScreen()),
            child: Image.asset(
              Assets.iconMenu,
              scale: 16,
              color: appRedColor,
            ),
          ),
          // actions: [
          //   LanguageDropDown(width: width),
          // ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04, horizontal: width * 0.04),
            child: order == null?const Center(
              child: CircularProgressIndicator(),
            ):SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Get.toNamed("/rider_new_order/",arguments: order!.data![index]),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: width * 0.04, horizontal: width * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order!.data![index].orderDetails!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.05),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10",
                                      style: TextStyle(
                                          color: appYellowColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "BHD",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.05),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: width * 0.03,
                            ),
                            Text(
                              order!.data![index].recieverName!,
                              style:const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: width * 0.03,
                            ),
                            Theme(
                              data: ThemeData(
                                  colorScheme: Theme.of(context)
                                      .colorScheme
                                      .copyWith(primary: appRedColor)),
                              child: Stepper(
                                physics:const NeverScrollableScrollPhysics(),
                                controlsBuilder: (context, onStepContinue) {
                                  return const SizedBox();
                                },
                                steps: [
                                  Step(
                                      isActive: true,
                                      title:const Text("Pickup location"),
                                      subtitle: Text( order!.data![index].nearestLandmark!),
                                      content: Container()),
                                  Step(
                                      isActive: true,
                                      title:const Text("Dropoff location"),
                                      subtitle: Text(order!.data![index].address!),
                                      content: Container()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: width * 0.04,
                    );
                  },
                  itemCount: order!.data!.length),
            )),
      ),
    );
  }
}
