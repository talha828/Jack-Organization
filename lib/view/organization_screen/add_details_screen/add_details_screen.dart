import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/model/userModel.dart';
import 'package:jack_delivery/utilities/utilities.dart';

import '../../../GetXModel/GetUserModel.dart';
import '../../../component/constant/constant.dart';
import '../../../component/widgets/add_details_text_fields_screen.dart';
import '../../../component/widgets/loading_indicator.dart';
import '../../../generated/assets.dart';
import '../drawer_screen/drawer_screen.dart';
import '../looking_for_a_rider_screen/looking_for_a_rider_screen.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final user = Get.find<GetUserModel>();
  final List<TextEditingController> _controller =
      List.generate(5, (index) => TextEditingController());
  int maxline = 1;
  int _groupValue = -1;
  String hintText = "Enter text here";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
            title: Text("add_details".tr),
            // actions: [
            //   LanguageDropDown(width: width),
            // ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: height - 130,
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AddDetailsTextField(
                      controller: _controller[0],
                      maxline: maxline,
                      hintText: "receiver_name".tr,
                      width: width),
                  AddDetailsTextField(
                      controller: _controller[1],
                      maxline: maxline,
                      hintText: "phone_number".tr,
                      width: width),
                  AddDetailsTextField(
                      controller: _controller[2],
                      maxline: maxline,
                      hintText: "address".tr,
                      width: width),
                  AddDetailsTextField(
                      controller: _controller[3],
                      maxline: maxline,
                      hintText: "nearest_landmark".tr,
                      width: width),
                  AddDetailsTextField(
                      controller: _controller[4],
                      maxline: 5,
                      hintText: "order_details".tr,
                      width: width),
                  Text(
                    "payment_status".tr,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: _myRadioButton(
                          title: "completed".tr,
                          value: 0,
                          width: width,
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue!),
                        ),
                      ),
                      Flexible(
                        child: _myRadioButton(
                          title: "pending".tr,
                          value: 1,
                          width: width,
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue!),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => Utilities.postOrderDetails(
                          name: _controller[0].text,
                          number: _controller[1].text,
                          address: _controller[2].text,
                          landmark: _controller[3].text,
                          details: _controller[4].text,
                          status: _groupValue == 0 ? "Completed" : "Pending",
                          lat: "114.5110151",
                          long: "-8.4556973",
                          width: width,
                          setLoading: (bool value) =>
                              setState(() => isLoading = value),
                          token: user.user.value.user!.token!),
                      child: Text("confirm".tr)),
                ],
              ),
            ),
          ),
        ),
        isLoading
            ? Positioned.fill(
                child: LoadingIndicator(),
              )
            : Container(),
      ],
    ));
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
}
