import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/backend/organization_backend/backend.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/drawer_screen/drawer_screen.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../component/widgets/total_number_of_delivery_card.dart';
import '../../../model/get_order_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final user = Get.find<GetUserModel>();
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

  // List of items in our dropdown menu
  var items = [
    'chose_rider'.tr,
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
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
          //TODO :// ADD DRAWER for rider
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                TotalNumberOfDeliveryCard(
                    onTap: () {},
                    width: width,
                    totalNumberOfDelivery:
                    order == null ? "0" : order!.count.toString(),
                    date: order == null
                        ? "--_--_--"
                        : order!.data!.last.createdAt!.substring(0, 10)),
                SizedBox(
                  width: width * 0.04,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.04, horizontal: width * 0.04),
                  width: width * 0.4,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "your_wallet".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.06),
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      Text(
                        "24",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: appYellowColor,
                            fontSize: width * 0.07),
                      ),
                      SizedBox(
                        height: width * 0.01,
                      ),
                      Text(
                        "BHD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: width * 0.05),
                      ),
                      SizedBox(
                        height: width * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:const [
                          Icon(Icons.account_balance_wallet_sharp,color: appRedColor,),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Row(
              children: [
                Text(
                  "google_map".tr,
                  style:const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: width * 0.04,),
            SizedBox(
              height: width * 0.85,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
