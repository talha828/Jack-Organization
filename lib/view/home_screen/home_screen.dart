import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/drawer_screen/drawer_screen.dart';
import 'package:jack_delivery/view/order_tracking_screen/order_tracking_screen.dart';

import '../../component/widgets/language_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.04, horizontal: width * 0.04),
                  width: width * 0.48,
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
                        "total_delivery_today".tr,
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
                        height: width * 0.04,
                      ),
                      Text(
                        "24-12-2023",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                InkWell(
                  onTap: ()=>Get.to(const OrderTrackingScreen()),
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
                )
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
                  height: width * 0.87,
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
