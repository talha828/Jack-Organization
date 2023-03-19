import 'package:flutter/material.dart';
import 'package:jack_delivery/component/constant/constant.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.image,
    required this.title,
  }) : super(key: key);

  final Null Function() onTap;
  final bool isSelected;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color:isSelected?appYellowColor.withOpacity(0.2): Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset:const Offset(-2, 2),
                blurRadius: 7,
                color:isSelected?appYellowColor.withOpacity(0.2): Colors.grey.withOpacity(0.2),
                spreadRadius: 8,
              ),
            ]
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image),
            Text(title,style:const TextStyle(color:appRedColor ,fontWeight: FontWeight.bold),),

          ],
        ),),
    );
  }
}