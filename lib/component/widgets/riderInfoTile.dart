
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../model/riderModel.dart';
import '../constant/constant.dart';

class RiderInfoTile extends StatelessWidget {
  const RiderInfoTile({
    super.key,
    required this.width,
    required this.dropdownvalue,
    required this.onCall,
    required this.onSms,
  });

  final double width;
  final RiderModel? dropdownvalue;
  final  Function() onCall;
  final  Function() onSms;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: appBlackColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)),
            ),
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04,
                horizontal: width * 0.04),
            child: Text(
              "estimate_delivery".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: appBlackColor,
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04,
                horizontal: width * 0.04),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.02),
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
              title: Text(
                dropdownvalue!.riderName!,
                style:const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                dropdownvalue!.mobile!,
                style:const TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: SizedBox(
                width: width * 0.24,
                child: Row(
                  children: [
                    InkWell(
                      onTap: onCall,
                      child: CircleAvatar(
                        radius: width * 0.05,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          Assets.iconPhoneCall,
                          scale: 25,
                          color: appRedColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    InkWell(
                      onTap: onSms,
                      child: CircleAvatar(
                        radius: width * 0.05,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          Assets.iconChat,
                          scale: 25,
                          color: appRedColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
