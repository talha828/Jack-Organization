import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../backend/organization_backend/backend.dart';
import '../../../component/widgets/looking_rider_info_tile.dart';
import '../../../model/riderModel.dart';

class LookingForRiderScreen extends StatefulWidget {
  const LookingForRiderScreen({Key? key}) : super(key: key);

  @override
  State<LookingForRiderScreen> createState() => _LookingForRiderScreenState();
}

class _LookingForRiderScreenState extends State<LookingForRiderScreen> {
  static CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(24.844780, 67.081071),
    zoom: 14.4746,
  );
  final user = Get.find<GetUserModel>();
  setLocation() async {
    await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(location.latitude, location.latitude),
      zoom: 14.4746,
    );
    setState(() {});
  }

  @override
  void initState() {
    setLocation();
    getRider();
    super.initState();
  }

  RiderModel? dropdownvalue;

  List<RiderModel> items = [
    RiderModel(riderName: "Chose any Rider", sId: "000", mobile: "Loading"),
    RiderModel(riderName: "Select rider", sId: "11", mobile: "Loading"),
  ];
  List<RiderModel> rider = [];
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

  var onSms = () {};
  var onCall = () {};
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("looking_for_a_rider".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: appBlueColor,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   getRider();
      //   setLocation();
      // },child:const Icon(Icons.arrow_back),),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "search_for_near_by_rider".tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
            //Text("search_for_near_by_rider".tr,textAlign: TextAlign.left,style:const TextStyle(fontWeight: FontWeight.bold),),
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
            LookingRiderInfoTile(
                width: width,
                dropdownvalue: dropdownvalue,
                onCall:makeCall ,
                onSms:sendMessage ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/org_order_details/",arguments: dropdownvalue);
                } ,
                child: Text("confirm".tr))
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
