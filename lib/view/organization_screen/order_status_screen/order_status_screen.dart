import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/constant/constant.dart';
import '../../../generated/assets.dart';
import '../drawer_screen/drawer_screen.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
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
          onTap: () => Get.to(const DrawerScreen()),
          child: Image.asset(
            Assets.iconMenu,
            scale: 16,
            color: appRedColor,
          ),
        ),
        centerTitle: true,
        title: Text("order_status".tr),
        // actions: [
        //   LanguageDropDown(width: width),
        // ],
      ),
        body: ListView.separated(itemBuilder: (context,index){return
        ListTile(
          title: Text("Trc #090078601458"),
          subtitle: Text("Rider name Ahmed"),
          trailing: Column(
            children: [
              Text("03/02/2023",style: TextStyle(color: Colors.grey),),
              SizedBox(height: width * 0.03,),
              Text("Delivered",style: TextStyle(color: appLightBlueColor,fontWeight: FontWeight.bold),),
            ],
          ),
        );
        }, separatorBuilder: (context,index){return Divider();}, itemCount: 10),
      ),
    );
  }
}
