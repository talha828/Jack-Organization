import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';

import '../../component/widgets/language_dropdown.dart';
import '../../model/order_detais_model.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _groupValue = -1;
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
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(list[index].title),
                        subtitle: Text(list[index].subTitle),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      color: Colors.grey.withOpacity(0.2),
                    );
                  },
                  itemCount: list.length),
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
                  onPressed: () {}, child: Text("send_on_whatsapp".tr))
            ],
          ),
        ),
      ),
    );
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
