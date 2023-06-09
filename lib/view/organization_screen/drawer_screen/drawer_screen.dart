import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jack_delivery/model/drawer_model.dart';
import 'package:jack_delivery/view/common_screen/splash_screen/splash_screen.dart';
import '../../../component/constant/constant.dart';
import '../../../generated/assets.dart';
import '../about_us_screen/about_us_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../wallet_screen/wallet_screen.dart';



class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  GetStorage box= GetStorage();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
           leading: InkWell(
             onTap: ()=>Get.back(),
             child: Image.asset(
               Assets.iconMenu,
               scale: 16,
               color: appRedColor,
             ),
           ),
         ),
          body: ListView.separated(itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                switch(index){
                  case 0:
                    Get.to(const WalletScreen());
                    break;
                  case 1:
                    Get.to(const NotificationScreen());
                    break;
                  case 2:
                    Get.to(const AboutUsScreen());
                    break;
                  case 3:
                    box.write("user_type",null);
                    box.write("email",null);
                    box.write("password",null);
                    Get.to(const SplashScreen());
                    break;
                }
              },
              minVerticalPadding: 2,
              // contentPadding: EdgeInsets.symmetric(horizontal: width * 0.04),
              title: Text(list[index].title,style:const TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(list[index].icon,color: appYellowColor,),
            );
          }, separatorBuilder: (context,index){
            return const Divider(
              thickness: 1,

            );
          }, itemCount: list.length),
        )
    );
  }
  List <DrawerModel> list=[
    DrawerModel(title: "wallet".tr, icon: Icons.account_balance_wallet,),
    DrawerModel(title: "notification".tr, icon: Icons.notifications,),
    DrawerModel(title: "about_us".tr, icon: Icons.info,),
    DrawerModel(title: "logout".tr, icon: Icons.logout_rounded,),
  ];
}

