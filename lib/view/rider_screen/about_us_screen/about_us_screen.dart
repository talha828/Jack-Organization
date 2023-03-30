import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/generated/assets.dart';

import '../../../component/constant/constant.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(
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
        title: Text("aboutus".tr),
        // actions: [
        //   LanguageDropDown(width: width),
        // ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
                    child: Image.asset(Assets.imageLogo,scale: 5,)),
                Expanded(
                  child:
                  Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad,Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "),
                )
              ],
            ),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad,Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad,Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad,Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "),
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad,Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy "),
          ],
        ),
      ),
    ));
  }
}
