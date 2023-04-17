import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/GetXModel/GetUserModel.dart';
import 'package:jack_delivery/backend/organization_backend/backend.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';

import '../../../component/widgets/total_number_of_delivery_card.dart';
import '../../../model/get_order_model.dart';
import '../drawer_screen/drawer_screen.dart';
import '../order_tracking_screen/order_tracking_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final user=Get.find<GetUserModel>();

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.844780, 67.081071),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // Initial Selected Value
  String dropdownvalue = 'chose_rider'.tr;

  var items = [
    'chose_rider'.tr,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  GetOrderModel? order;
  getOrderDetails()async{
    var response=await BackEnd.getOrder();
    var data = jsonDecode(response.body);
    if (data['success'] == true){
    order= GetOrderModel.fromJson(data);
    setState(() {});
    }else{

    }

  }



  String totalNumberOfDelivery= "24";
  String date="24-12-2023";
  var onTap=(){};

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
        // actions: [
        //   LanguageDropDown(width: width),
        // ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()=>getOrderDetails(),
      //   child: Icon(Icons.add),
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                TotalNumberOfDeliveryCard(onTap: (){}, width: width, totalNumberOfDelivery: order == null ?"0":order!.count.toString(), date: order == null ?"--_--_--":order!.data!.last.createdAt!.substring(0,10)),
                SizedBox(
                  width: width * 0.04,
                ),
                OrderTrackerCard(onTap: ()=>Get.to(const OrderTrackingScreen()), width: width)
              ],
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Row(
              children: [
                Text(
                  "rider_live_location".tr,
                  style:const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Image.asset(
                  Assets.iconLocation,
                  scale: 1.5,
                ),
                const Spacer(),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconEnabledColor: appRedColor,
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                    ),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: appBlackColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: width * 0.04, horizontal: width * 0.04),
                        child: Text(
                          "estimate_delivery".tr,
                          textAlign: TextAlign.center,
                          style:const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: appBlackColor,
                        padding: EdgeInsets.symmetric(
                            vertical: width * 0.04, horizontal: width * 0.04),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width * 0.02),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  Assets.imageSignup,
                                  width: width * 0.15,
                                  height: width * 0.15,
                                )),
                          ),
                          title: Text(
                            "Ahmed Zubair",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "34922 BAHRAIN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Container(
                            width: width * 0.24,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: width * 0.05,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    Assets.iconPhoneCall,
                                    scale: 25,
                                    color: appRedColor,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                CircleAvatar(
                                  radius: width * 0.05,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    Assets.iconChat,
                                    scale: 25,
                                    color: appRedColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class OrderTrackerCard extends StatelessWidget {
  const OrderTrackerCard({
    super.key,
    required this.onTap,
    required this.width,
  });

  final Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        width: width * 0.4,
        height: width * 0.45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(-2, 2),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 7,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "track_order".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.055),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Image.asset(
              Assets.imageTrack,
              scale: 1.3,
            )
          ],
        ),
      ),
    );
  }
}
