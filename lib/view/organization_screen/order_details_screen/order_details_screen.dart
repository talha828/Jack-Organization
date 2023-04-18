import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/model/riderModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../GetXModel/GetOrderDetailsModel.dart';
import '../../../model/order_detais_model.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final order =Get.find<GetOrderDetailsModel>();
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    RiderModel rider =Get.arguments as RiderModel;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: appBlueColor,
              )),
          centerTitle: true,
          title: Text("order_details".tr),
          // actions: [
          //   LanguageDropDown(width: width),
          // ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
            color: Colors.white,
            child: ListTile(
              title: Text("receiver_name".tr),
              subtitle: Text(order.order.value.rider!),
            ),
          ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text("receiver_phone".tr),
                  subtitle: Text(order.order.value.mobile!),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text("receiver_address".tr),
                  subtitle: Text(order.order.value.address!),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text("rider_name".tr),
                  subtitle: Text(rider.riderName!),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text("rider_number_plate".tr),
                  subtitle: Text(rider.vehiclenumberplate!),
                ),
              ),
              Text(
                "send_rider_live_location".tr,
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: _myRadioButton(
                      title: "yes".tr,
                      value: 0,
                      width: width,
                      onChanged: (newValue) =>
                          setState(() => _groupValue = newValue!),
                    ),
                  ),
                  Flexible(
                    child: _myRadioButton(
                      title: "no".tr,
                      value: 1,
                      width: width,
                      onChanged: (newValue) =>
                          setState(() => _groupValue = newValue!),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.02,
              ),
              ElevatedButton(
                  onPressed:()=> openWhatsapp(context: context,text:"Receiver`s name ${order.order.value.rider} \n Receiver`s Phone Number ${order.order.value.rider} \n Receiver`s Address ${order.order.value.address} \n Rider name ${rider.riderName} \n Rider Number Plate ${rider.vehiclenumberplate}",number:rider.mobile! ), child: Text("send_on_whatsapp".tr))
            ],
          ),
        ),
      ),
    );
  }
  void openWhatsapp(
      {required BuildContext context,
        required String text,
        required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid ="whatsapp://send?phone=$number&text=${Uri.encodeFull(text)}";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
  Widget _myRadioButton(
      {required String title,
      required int value,
      required Function(int?)? onChanged,
      required double width}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(fontSize: width * 0.04),
      ),
    );
  }

  List<OrderDetailsModel> list = [
    OrderDetailsModel(title: "receiver_name".tr, subTitle: "Lorem ipsum dolor"),
    OrderDetailsModel(
        title: "receiver_phone".tr, subTitle: "+973 3122 323 986"),
    OrderDetailsModel(
        title: "receiver_address".tr,
        subTitle: "Lorem ipsum dolor sit lorem ipsum dolorsit"),
    OrderDetailsModel(title: "rider_name".tr, subTitle: "Ahmed Zubair"),
    OrderDetailsModel(
        title: "rider_number_plate".tr, subTitle: "34922 BAHRAIN"),
  ];
}
