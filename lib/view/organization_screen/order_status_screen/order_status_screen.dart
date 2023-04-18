import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../backend/organization_backend/backend.dart';
import '../../../component/constant/constant.dart';
import '../../../generated/assets.dart';
import '../../../model/get_order_model.dart';
import '../drawer_screen/drawer_screen.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {


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
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
          title: Text("order_status".tr),
        ),
        body: order == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(order!.data![index].rider!.sId.toString()),
                    subtitle: Text(order!.data![index].rider!.riderName
                        .toString()
                        .toUpperCase()),
                    trailing: Column(
                      children: [
                        Text(
                          order!.data![index].createdAt!.substring(0, 10),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        Text(
                          order!.data![index].orderstatus!,
                          style: TextStyle(
                              color:
                                  order!.data![index].orderstatus == "Pending"
                                      ? appLightBlueColor
                                      : appYellowColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: order == null ? 0 : order!.data!.length),
      ),
    );
  }
}
