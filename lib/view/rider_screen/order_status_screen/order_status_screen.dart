import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/view/rider_screen/drawer_screen/drawer_screen.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../backend/organization_backend/backend.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/loading_indicator.dart';
import '../../../generated/assets.dart';
import '../../../model/get_order_model.dart';
import 'package:http/http.dart' as http;

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
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
  bool isLoading=false;

  setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }

  @override
  void initState() {
    getOrderDetails();
    super.initState();
  }

  bool _check = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
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
              title: const Text("Order Statue"),
              // actions: [
              //   LanguageDropDown(width: width),
              // ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: order == null
                    ?const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: const Text("Deliver to"),
                                subtitle: Text(order!.data![index].recieverName!),
                                trailing: Text(
                                  order!.data![index].createdAt!.substring(0, 10),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.04),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Update status",
                                      style: TextStyle(fontSize: width * 0.04),
                                    ),
                                    Checkbox(
                                        value: order!.data![index].paymentStatus! == "Completed"?true:false,
                                        onChanged: (value) async{
                                          // var response=await http.put(Uri.parse("https://jackdelivery-full-backend.onrender.com/api/orderStatus/${order!.data![index].sId}"),headers: {  'Authorization': 'Bearer ${user.user.value.user!.token}',},body: {
                                          //   "Orderstatus":"Delivered",
                                          // });
                                          // var data=jsonDecode(response.body);
                                          // print(data.toString());
                                          setLoading(true);
                                          final Uri uri = Uri.parse('https://jackdelivery-full-backend.onrender.com/api/update/${order!.data![index].sId}');
                                          final Map<String, dynamic> orderData = {'PaymentStatus': value! ?"Completed":"Pending"};

                                          try {
                                            final response = await http.put(uri,
                                                headers: {'Authorization': 'Bearer ${user.user!.value.user!.token}'},
                                                body: json.encode(orderData));
                                            var dd=jsonDecode(response.body);
                                            print(dd.toString());
                                            if (response.statusCode == 200) {
                                              setLoading(false);
                                              Get.snackbar("Congratulation", "Order Update Successfully",
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: width * 0.05, horizontal: width * 0.04));
                                              setState(() {
                                                _check = value!;
                                                order!.data![index].paymentStatus =value?"Completed":"Pending";
                                                // order=null;
                                              });
                                              // Get.toNamed('/rider_main/');
                                            } else {
                                              setLoading(false);
                                              Get.snackbar("Something went wrong", "Order Can`t be Updated",
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: width * 0.05, horizontal: width * 0.04));
                                            }
                                          } catch (error) {
                                            setLoading(false);
                                            Get.snackbar("Something went wrong", "Order Can`t be Updated",
                                                margin: EdgeInsets.symmetric(
                                                    vertical: width * 0.05, horizontal: width * 0.04));
                                          }
                                          // if(response.statusCode == 200){
                                          //   getOrderDetails();
                                          // }
                                          // else{
                                          //   Get.snackbar("Something went wrong", "Check Your internet",
                                          //       margin: EdgeInsets.symmetric(
                                          //           vertical: width * 0.05, horizontal: width * 0.04));
                                          // }
                                        }),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1.5,
                          );
                        },
                        itemCount: 5)),
          ),
          isLoading
              ? Positioned.fill(
            child: LoadingIndicator(),
          )
              : Container(),
        ],
      ),
    );
  }
}
