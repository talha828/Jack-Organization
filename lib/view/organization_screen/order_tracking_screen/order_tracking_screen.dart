import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';

import '../../../component/widgets/add_details_text_fields_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: appBlueColor,
            ),
            onPressed: () => Get.back(),
          ),
          title: const Text("Order Tracking"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter Tracking Number",
                textAlign: TextAlign.start,
              ),
              AddDetailsTextField(
                  controller: _controller,
                  maxline: 1,
                  hintText: "receiver_name".tr,
                  width: width),
              ElevatedButton(onPressed: () {}, child: Text("Track Order")),
              Stepper(steps: [
                Step(
                    title: Text("Order dispatched"),
                    subtitle: Text("Order dispatched"),
                    content: Container()),
                Step(
                    title: Text("Order dispatched"),
                    subtitle: Text("Order dispatched"),
                    content: Container()),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
