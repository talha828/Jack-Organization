
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';

class TotalNumberOfDeliveryCard extends StatelessWidget {
  const TotalNumberOfDeliveryCard({
    super.key,
    required this.onTap,
    required this.width,
    required this.totalNumberOfDelivery,
    required this.date,
  });

  final Null Function() onTap;
  final double width;
  final String totalNumberOfDelivery;
  final String date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        width: width * 0.48,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(-2, 2),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 7,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "total_delivery_today".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.06),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Text(
              totalNumberOfDelivery,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appYellowColor,
                  fontSize: width * 0.07),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Text(
              date,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: width * 0.04),
            ),
          ],
        ),
      ),
    );
  }
}
