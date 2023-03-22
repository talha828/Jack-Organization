import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jack_delivery/component/constant/constant.dart';

import '../../../generated/assets.dart';
import '../order_details_screen/order_details_screen.dart';


class LookingForRiderScreen extends StatefulWidget {
  const LookingForRiderScreen({Key? key}) : super(key: key);

  @override
  State<LookingForRiderScreen> createState() => _LookingForRiderScreenState();
}

class _LookingForRiderScreenState extends State<LookingForRiderScreen> {
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.844780, 67.081071),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            title: Text("looking_for_a_rider".tr),
            leading: IconButton(onPressed: ()=>Get.back(),icon:const Icon(Icons.arrow_back,color: appBlueColor,),),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text("search_for_near_by_rider".tr,textAlign: TextAlign.left,style:const TextStyle(fontWeight: FontWeight.bold),),
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
                Container(
                  color: appBlackColor,
                  padding: EdgeInsets.symmetric(
                      vertical: width * 0.04, horizontal: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
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
                        title:const Text(
                          "Ahmed Zubair",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle:const Text(
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
                      SizedBox(height: width * 0.04,),
                      Text("Ahmed ${"has_accepted_your_delivery_request".tr}",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      SizedBox(width: width * 0.04,),
                      Text("${"will_be_arriving_in".tr} 10 ${"mints".tr}",textAlign: TextAlign.left,style:const TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                ElevatedButton(onPressed: ()=>Get.to(const OrderDetailsScreen()), child: Text("confirm".tr))
              ],
            ),
          ),
        )
    );
  }
}
