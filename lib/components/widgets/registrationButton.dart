import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.image,
    required this.title,
    this.scale,
  }) : super(key: key);

  final Null Function() onTap;
  final double width;
  final String image;
  final String title;
  final double? scale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.1),
        width: width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow:  [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5), blurRadius: 7, offset: Offset(-2, 2))
            ]),
        child: Column(
          children: [
            Image.asset(
              image,
              scale: scale,
            ),
            SizedBox(
              height: width * 0.04,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
