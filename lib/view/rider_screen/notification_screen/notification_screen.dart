import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../backend/organization_backend/backend.dart';
import '../../../component/constant/constant.dart';
import '../../../model/get_order_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  GetOrderModel? order;
  getOrderDetails() async {
    var response = await BackEnd.getOrder();
    var data = jsonDecode(response.body);
    if (data['success'] == true) {
      order = GetOrderModel.fromJson(data);
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
    var width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: appBlueColor,
              )),
          centerTitle: true,
          title: Text("notification".tr),
          // actions: [
          //   LanguageDropDown(width: width),
          // ],
        ),
        body: order== null?Center(child: CircularProgressIndicator(),):ListView.separated(itemBuilder: (context,index){return
          order!.data![index].orderstatus == "Delivered"?ListTile(
            title: Text("Delivery to ${order!.data![index].recieverName}  ${order!.data![index].address}",maxLines: 2,),
            trailing: Column(
              children: [
                Text(order!.data![index].createdAt!.substring(0,10),style:const TextStyle(color: Colors.grey),),
                SizedBox(height: width * 0.03,),
                Text("Successful",style: TextStyle(color: appRedColor,fontWeight: FontWeight.bold),),
              ],
            ),
          ):Container();
        }, separatorBuilder: (context,index){return order!.data![index].orderstatus == "Delivered"?Divider():Container();}, itemCount: order != null ?order!.data!.length:0),
      ),
    );
  }
}
