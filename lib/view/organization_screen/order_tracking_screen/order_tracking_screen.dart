import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Tracking Number",
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: width * 0.05,),
                  AddDetailsTextField(
                      controller: _controller,
                      maxline: 1,
                      hintText: "receiver_name".tr,
                      width: width),
                  SizedBox(height: width * 0.05,),
                  ElevatedButton(onPressed: () {}, child:const Text("Track Order")),
                ],
              )
              // Stack(
              //   children: [
              //     Column(
              //       children: [
              //         SizedBox(height: width * 0.04,),
              //         Container(
              //           padding: EdgeInsets.only(left: width * 0.03),
              //           child: SizedBox(
              //             height: width * 0.3,
              //             child: const VerticalDivider(
              //               thickness: 2,
              //               color: appRedColor,
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.only(left: width * 0.03),
              //           child: SizedBox(
              //             height: width * 0.3,
              //             child: const VerticalDivider(
              //               thickness: 2,
              //               color: appRedColor,
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.only(left: width * 0.03),
              //           child: SizedBox(
              //             height: width * 0.15,
              //             child: const VerticalDivider(
              //               thickness: 2,
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         // first step
              //         Row(
              //           children: [
              //             CircleAvatar(
              //               backgroundColor: appRedColor,
              //               child: Image.asset(Assets.iconPin),
              //             ),
              //             SizedBox(
              //               width: width * 0.04,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Order dispatched",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: width * 0.04),
              //                 ),
              //                 SizedBox(
              //                   height: width * 0.02,
              //                 ),
              //                 Text("Order dispatched from Albaik"),
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: width * 0.05,),
              //         // second step
              //         Row(
              //           children: [
              //
              //             Padding(
              //                 padding: EdgeInsets.only(left: width * 0.03),
              //                 child: CircleAvatar(
              //                   backgroundColor: appRedColor,
              //                   radius: width * 0.02,
              //                 )),
              //             SizedBox(
              //               width: width * 0.04,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Order Received",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: width * 0.04),
              //                 ),
              //                 SizedBox(
              //                   height: width * 0.02,
              //                 ),
              //                 Text("Received by"),
              //
              //                 // second Step
              //                 Container(
              //                   color: appBlackColor,
              //                   padding: EdgeInsets.symmetric(
              //                       vertical: width * 0.04,
              //                       horizontal: width * 0.02),
              //                   margin: EdgeInsets.symmetric(
              //                       vertical: width * 0.02,
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                     children: [
              //                       Container(
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           borderRadius: BorderRadius.circular(50),
              //                         ),
              //                         child: ClipRRect(
              //                             borderRadius: BorderRadius.circular(50),
              //                             child: Image.asset(
              //                               Assets.imagePersonImage,
              //                               width: width * 0.15,
              //                               height: width * 0.15,
              //                             )),
              //                       ),
              //                       SizedBox(
              //                         width: width * 0.04,
              //                       ),
              //                       Column(
              //                         children: [
              //                           Text(
              //                             "Ahmed Zubair",
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                           SizedBox(
              //                             width: width * 0.02,
              //                           ),
              //                           Text(
              //                             "34922 BAHRAIN",
              //                             style: TextStyle(
              //                               color: Colors.white,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         width: width * 0.04,
              //                       ),
              //                       SizedBox(
              //                         width: width * 0.24,
              //                         child: Row(
              //                           children: [
              //                             CircleAvatar(
              //                               radius: width * 0.05,
              //                               backgroundColor: Colors.white,
              //                               child: Image.asset(
              //                                 Assets.iconPhoneCall,
              //                                 scale: 25,
              //                                 color: appRedColor,
              //                               ),
              //                             ),
              //                             SizedBox(
              //                               width: width * 0.04,
              //                             ),
              //                             CircleAvatar(
              //                               radius: width * 0.05,
              //                               backgroundColor: Colors.white,
              //                               child: Image.asset(
              //                                 Assets.iconChat,
              //                                 scale: 25,
              //                                 color: appRedColor,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: width * 0.05,),
              //         Row(
              //           children: [
              //             Padding(
              //               padding:  EdgeInsets.only(left: width * 0.03),
              //               child: CircleAvatar(
              //                 backgroundColor: appRedColor,
              //                 radius: width * 0.02,
              //               ),
              //             ),
              //             SizedBox(
              //               width: width * 0.07,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Order dispatched",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: width * 0.04),
              //                 ),
              //                 SizedBox(
              //                   height: width * 0.02,
              //                 ),
              //                 Text("Order dispatched from Albaik"),
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: width * 0.05,),
              //         Row(
              //           children: [
              //             CircleAvatar(
              //               backgroundColor: Colors.grey,
              //               child: Image.asset(Assets.iconCheckMark,scale: 25,color: Colors.white,),
              //             ),
              //             SizedBox(
              //               width: width * 0.04,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Order dispatched",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: width * 0.04),
              //                 ),
              //                 SizedBox(
              //                   height: width * 0.02,
              //                 ),
              //                 Text("Order dispatched from Albaik"),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //
              //   ],
              // )
              // Testing4()
            ],
          ),
        ),
      ),
    );
  }
}
