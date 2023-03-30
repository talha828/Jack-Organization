import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/generated/assets.dart';
import 'package:jack_delivery/view/rider_screen/drawer_screen/drawer_screen.dart';
import 'package:jack_delivery/view/rider_screen/new_order_accept_screen/new_order_accept_screen.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: width * 0.04, horizontal: width * 0.04),
            child: Column(
              children: [
                InkWell(
                  onTap: ()=>Get.to(const NewOrderAcceptScreen()),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.04, horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Lorem Ipsum dolor sit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                            Row(
                              children: [
                                Text("10",style: TextStyle(color: appYellowColor,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                                SizedBox(width: width * 0.02,),
                                Text("BHD",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: width * 0.03,),
                        Text("Lorem Ipsum dolor sit",style: TextStyle(color: Colors.grey),),
                        SizedBox(height: width * 0.03,),
                        Theme(
                          data: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: appRedColor)),
                          child: Stepper(
                              controlsBuilder: (context, onStepContinue) {
                                return SizedBox();
                              },
                              steps: [
                                Step(
                                    isActive:true,
                                    title: Text("Pickup location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                                Step(
                                    isActive: true,
                                    title: Text("Dropoff location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                              ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: width * 0.04,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: width * 0.04, horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lorem Ipsum dolor sit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                          Row(
                            children: [
                              Text("10",style: TextStyle(color: appYellowColor,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                              SizedBox(width: width * 0.02,),
                              Text("BHD",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.03,),
                      Text("Lorem Ipsum dolor sit",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: width * 0.03,),
                      Theme(
                        data: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: appRedColor)),
                        child: Stepper(
                            controlsBuilder: (context, onStepContinue) {
                              return SizedBox();
                            },
                            steps: [
                              Step(
                                  isActive:true,
                                  title: Text("Pickup location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                              Step(
                                  isActive: true,
                                  title: Text("Dropoff location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                            ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: width * 0.04,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: width * 0.04, horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Lorem Ipsum dolor sit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                          Row(
                            children: [
                              Text("10",style: TextStyle(color: appYellowColor,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                              SizedBox(width: width * 0.02,),
                              Text("BHD",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: width * 0.05),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.03,),
                      Text("Lorem Ipsum dolor sit",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: width * 0.03,),
                      Theme(
                        data: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: appRedColor)),
                        child: Stepper(
                            controlsBuilder: (context, onStepContinue) {
                              return SizedBox();
                            },
                            steps: [
                              Step(
                                  isActive:true,
                                  title: Text("Pickup location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                              Step(
                                  isActive: true,
                                  title: Text("Dropoff location"),subtitle: Text("Lorem Ipsum dolor sit"), content: Container()),
                            ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
