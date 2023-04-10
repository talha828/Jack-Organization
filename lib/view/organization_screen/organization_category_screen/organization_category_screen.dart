import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/component/widgets/language_dropdown.dart';

import '../../../component/widgets/category_card.dart';
import '../../../generated/assets.dart';
import '../../../model/organization_card_model.dart';
import '../sign_up_screen/sign_up_screen.dart';

class OrganizationCategoryScreen extends StatefulWidget {
  const OrganizationCategoryScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationCategoryScreen> createState() =>
      _OrganizationCategoryScreenState();
}

class _OrganizationCategoryScreenState
    extends State<OrganizationCategoryScreen> {
  var onTap = () {};
  String title = "Fast Food";
  String image = Assets.imageBurger;
  bool isSelected = true;

  int index = -1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Organization".tr, style: textBold),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: appBlueColor,
            ),
          ),
          actions: [
            LanguageDropDown(width: width),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: width * 0.05, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("chose_your_category".tr,
                  textAlign: TextAlign.center, style: textBold),
              SizedBox(
                height: width * 0.06,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: width * 0.05,
                    mainAxisSpacing: width * 0.05,
                    children: [
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[0].title) {
                                  list[0].isSelected =
                                      list[0].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 0;
                            });
                          },
                          isSelected: list[0].isSelected,
                          image: list[0].image,
                          title: "fast_food".tr),
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[1].title) {
                                  list[1].isSelected =
                                      list[1].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 1;
                            });
                          },
                          isSelected: list[1].isSelected,
                          image: list[1].image,
                          title: "groceries".tr),
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[2].title) {
                                  list[2].isSelected =
                                      list[2].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 2;
                            });
                          },
                          isSelected: list[2].isSelected,
                          image: list[2].image,
                          title: "gifts".tr),
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[3].title) {
                                  list[3].isSelected =
                                      list[3].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 3;
                            });
                          },
                          isSelected: list[3].isSelected,
                          image: list[3].image,
                          title: "medical_store".tr),
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[4].title) {
                                  list[4].isSelected =
                                      list[4].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 4;
                            });
                          },
                          isSelected: list[4].isSelected,
                          image: list[4].image,
                          title: "general_store".tr),
                      CategoryCard(
                          onTap: () {
                            setState(() {
                              for (var i in list) {
                                if (i.title == list[5].title) {
                                  list[5].isSelected =
                                      list[5].isSelected ? false : true;
                                } else {
                                  i.isSelected = false;
                                }
                              }
                              index = 5;
                            });
                          },
                          isSelected: list[5].isSelected,
                          image: list[5].image,
                          title: "others".tr),
                    ]),
              ),
              ElevatedButton(
                  onPressed: () {
                    index == -1
                        ? Get.snackbar("Please Select category",
                            "You must need to set category in order to proceed",
                            margin: EdgeInsets.symmetric(vertical: width * 0.05, horizontal: width * 0.04))
                        : Get.toNamed("/org_sign_up/",parameters: {"category":category[index]});
                  },
                  child: Text("Continue".tr))
            ],
          ),
        ),
      ),
    );
  }
  List<String>category=["Fast Food","Groceries","Gifts","Medical Store","General Store","Others"];
  List<CategoryCardModel> list = [
    CategoryCardModel(
        title: "fast_food".tr, image: Assets.imageBurger, isSelected: false),
    CategoryCardModel(
        title: "groceries".tr, image: Assets.imageGroceries, isSelected: false),
    CategoryCardModel(
        title: "gifts".tr, image: Assets.imageGifts, isSelected: false),
    CategoryCardModel(
        title: "medical_store".tr,
        image: Assets.imageMedicalStore,
        isSelected: false),
    CategoryCardModel(
        title: "general_store".tr,
        image: Assets.imageGeneralStore,
        isSelected: false),
    CategoryCardModel(
        title: "others".tr, image: Assets.imageOther, isSelected: false),
  ];
}
