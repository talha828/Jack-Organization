
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';

class OrderTrackerCard extends StatelessWidget {
  const OrderTrackerCard({
    super.key,
    required this.onTap,
    required this.width,
  });

  final Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        width: width * 0.4,
        height: width * 0.45,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 2),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 7,
            spreadRadius: 5,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "track_order".tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: width * 0.055),
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Image.asset(
              Assets.imageTrack,
              scale: 1.3,
            )
          ],
        ),
      ),
    );
  }
}
