import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' as store;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/GetXModel/GetUserModel.dart';
import 'package:jack_delivery/backend/organization_backend/backend.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../component/widgets/orderTrackerCard.dart';
import '../../../component/widgets/riderInfoTile.dart';
import '../../../component/widgets/total_number_of_delivery_card.dart';
import '../../../model/get_order_model.dart';
import '../../../model/riderModel.dart';
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

  final user = Get.find<GetUserModel>();

  static CameraPosition? _kGooglePlex = const CameraPosition(
    target: LatLng(24.844780, 67.081071),
    zoom: 14.4746,
  );

  // Initial Selected Value
  RiderModel? dropdownvalue;

  List<RiderModel> items = [
    RiderModel(riderName: "Chose any Rider", sId: "000", mobile: "Loading"),
    RiderModel(riderName: "Select rider", sId: "11", mobile: "Loading"),
  ];
  List<RiderModel> rider = [];
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

  getRider() async {
    var response = await BackEnd.getRider(token: user.user.value.user!.token!);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var i in data) {
        rider.add(RiderModel.fromJson(i));
        items.clear();
        for (var i in rider) {
          if (i.riderName != "") {
            items.add(i);
          }
        }
        dropdownvalue = items[0];
        print(rider.length);
        setState(() {});
      }
    } else {
      Get.snackbar("Something went wrong r", "Please load you screen again",
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15));
    }
  }

  setLocation() async {
    await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(location.latitude, location.latitude),
      zoom: 14.4746,
    );
    setState(() {});
  }

  String totalNumberOfDelivery = "24";
  String date = "24-12-2023";
  var onSms = () {};
  var onCall = () {};

  @override
  void initState() {
    dropdownvalue = items[0];
    getOrderDetails();
    setLocation();
    getRider();
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
                OrderTrackerCard(
                    onTap: () => Get.to(const OrderTrackingScreen()),
                    width: width)
              ],
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Row(
              children: [
                Text(
                  "rider_live_location".tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  child: DropdownButton<RiderModel>(
                    iconEnabledColor: appRedColor,
                    value: dropdownvalue,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: items.map((RiderModel items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items.riderName!),
                      );
                    }).toList(),
                    onChanged: (RiderModel? newValue) {
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
                      initialCameraPosition: _kGooglePlex!,
                    ),
                  ),
                ),
                rider == null
                    ? Container()
                    : RiderInfoTile(
                        width: width,
                        dropdownvalue: dropdownvalue,
                        onCall: makeCall,
                        onSms: sendMessage),
              ],
            )
          ],
        ),
      ),
    ));
  }
  sendMessage() async {
    // Android
     String uri = 'sms:${dropdownvalue!.mobile}?body=hello';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      String uri = 'sms:${dropdownvalue!.mobile}?body=hello';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  makeCall() async {
    // Android
    String uri = 'tel://${dropdownvalue!.mobile}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      String uri = 'tel://${dropdownvalue!.mobile}';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}
