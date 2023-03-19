import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/constant/constant.dart';
import 'package:jack_delivery/component/widgets/language_dropdown.dart';
import 'package:jack_delivery/view/sign_up_screen/sign_up_screen.dart';
import '../../component/widgets/category_card.dart';
import '../../generated/assets.dart';
import '../../model/organization_card_model.dart';

class OrganizationCategoryScreen extends StatefulWidget {
  const OrganizationCategoryScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationCategoryScreen> createState() => _OrganizationCategoryScreenState();
}

class _OrganizationCategoryScreenState extends State<OrganizationCategoryScreen> {
  var onTap = () {};
  String title = "Fast Food";
  String image = Assets.imageBurger;
  bool isSelected = true;
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
          title: const Text(
            "Organization",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
              const Text(
                "Choose Your Category",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: width * 0.06,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: width * 0.05,
                  mainAxisSpacing: width * 0.05,
                  children: list
                      .map(
                        (e) => CategoryCard(
                            onTap: () {
                              setState(
                                () {
                                  for (var i in list) {
                                    if (i.title == e.title) {
                                      e.isSelected =
                                          e.isSelected ? false : true;
                                    } else {
                                      i.isSelected = false;
                                    }
                                  }
                                },
                              );
                            },
                            isSelected: e.isSelected,
                            image: e.image,
                            title: e.title),
                      ).toList(),
                ),
              ),
              ElevatedButton(onPressed: (){
                Get.to(const SignUpScreen());
              }, child: Text("Continue".tr))
            ],
          ),
        ),
      ),
    );
  }

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
