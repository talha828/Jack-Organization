import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/constant/constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: appBlueColor,
              )),
          centerTitle: true,
          title: Text("notification".tr),
          // actions: [
          //   LanguageDropDown(width: width),
          // ],
        ),
        body: ListView.separated(itemBuilder: (context,index){return
          ListTile(
            title: Text("Delivery to 2G29+2M5, Unnamed Road،, العمر، Bahrain"),
            trailing: Column(
              children: [
                Text("03/02/2023",style: TextStyle(color: Colors.grey),),
                SizedBox(height: width * 0.03,),
                Text("Successful",style: TextStyle(color: appRedColor,fontWeight: FontWeight.bold),),
              ],
            ),
          );
        }, separatorBuilder: (context,index){return Divider();}, itemCount: 10),
      ),
    );
  }
}
