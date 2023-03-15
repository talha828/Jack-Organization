import 'package:flutter/material.dart';

import '../../components/constant/constant.dart';
import '../../components/widgets/language_dropdown.dart';
import '../../components/widgets/registrationButton.dart';
import '../../generated/assets.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
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
        body: SingleChildScrollView(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RegistrationButton(
                      onTap: () {},
                      width: width,
                      image: Assets.imageBurger,
                      title: "Fast Food"),
                  RegistrationButton(
                      onTap: () {},
                      width: width,
                      image: Assets.imageGroceries,
                      title: "Groceries"),
                ],
              ),
              SizedBox(
                height: width * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RegistrationButton(
                      onTap: () {},
                      width: width,
                      image: Assets.imageGifts,
                      title: "Gifts"),
                  RegistrationButton(
                      onTap: () {},
                      width: width,
                      image: Assets.imageMedicalStore,
                      title: "Medical Store"),
                ],
              ),
              SizedBox(
                height: width * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RegistrationButton(
                      onTap: () {},
                      width: width,
                      image: Assets.imageGeneralStore,
                      title: "General Store"),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: width * 0.21),
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: appYellowColor.withOpacity(0.5)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:  [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset:const Offset(-2, 2))
                          ]),
                      child: Column(
                        children: const [
                          Text("Others",style: TextStyle(color: appYellowColor,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: width * 0.02),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Continue"),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
