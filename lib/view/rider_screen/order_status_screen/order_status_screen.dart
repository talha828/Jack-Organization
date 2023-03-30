import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/view/rider_screen/drawer_screen/drawer_screen.dart';

import '../../../component/constant/constant.dart';
import '../../../generated/assets.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  bool _check = true;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
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
            centerTitle: true,
            title: Text("Order Statue"),
            // actions: [
            //   LanguageDropDown(width: width),
            // ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
          child: ListView.separated(itemBuilder: (context,index){return Container(
            child: Column(
              children: [
                ListTile(
                  title: Text("Delivery to"),
                  subtitle: Text("Receiver's name"),
                  trailing: Text("03/02/2023",style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Update status",style: TextStyle(fontSize: width * 0.04),),
                      Checkbox(value: _check, onChanged: (value){
                        setState(() {
                          _check=value!;
                        });
                      }),
                    ],
                  ),
                )
              ],
            ),
          );}, separatorBuilder: (context,index){return Divider(thickness: 1.5,);}, itemCount: 5)
          ),
        ),
    );
  }
}
