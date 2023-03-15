import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/view/register_as_screen/register_as_screen.dart';

import '../../components/constant/constant.dart';
import '../../components/widgets/language_dropdown.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        height: width * 0.35,
        padding: EdgeInsets.symmetric(
            vertical: width * 0.04, horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Checkbox(
                  value: check,
                  onChanged: (value) => setState(
                    () {
                      check ? check = false : check = true;
                    },
                  ),
                ),
                const Text("I agree to the term and condition"),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ElevatedButton(
                  onPressed: () async {
                    check?Get.to(const RegisterAsScreen()):Get.snackbar(
                      "Accept the Term And Conditions",
                      "For Proceed you must need to accept term and conditions",
                      duration: const Duration(seconds: 5),
                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.symmetric(
                          vertical: width * 0.05, horizontal: width * 0.05),
                    );
                  },
                  child: const Text("Continue")),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Term And Conditions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.06),
                  ),
                  LanguageDropDown(width: width)
                ],
              ),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure "),
              SizedBox(
                height: width * 0.04,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}



