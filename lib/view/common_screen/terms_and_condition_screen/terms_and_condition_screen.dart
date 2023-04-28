import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jack_delivery/component/widgets/language_dropdown.dart';

import '../register_as_screen/register_as_screen.dart';


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
                Text("agree".tr),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ElevatedButton(
                  onPressed: () async {
                    check?Get.toNamed("/register_as/"):Get.snackbar(
                      "Accept the Term And Conditions",
                      "For Proceed you must need to accept term and conditions",
                      duration: const Duration(seconds: 5),
                      snackPosition: SnackPosition.BOTTOM,
                      margin: EdgeInsets.symmetric(
                          vertical: width * 0.05, horizontal: width * 0.05),
                    );
                  },
                  child: Text("Continue".tr)),
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
                    "term_and_condition_title".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.06),
                  ),
                  LanguageDropDown(width: width),
                ],
              ),
              SizedBox(
                height: width * 0.04,
              ),
              const Text(
                  "User Responsibilities: Users are responsible for maintaining the confidentiality of their login details and ensuring that their account information is accurate and up to date. Users must also agree to use the app only for lawful purposes."

                "Service Provision: Jack Delivery app provides delivery services as per the user's order. The app may also offer different delivery options and fees depending on the user's location, the distance between the pickup and delivery points, and other relevant factors."

              "Payment: The app may require users to pay for their orders through the app using a valid payment method. Payment methods may include credit cards, debit cards, mobile wallets, or other forms of electronic payment."

              "Order Cancellation: Users may be allowed to cancel their orders under certain conditions, such as if the merchant is unable to fulfill the order or if the order has not been picked up by the delivery person. The app may have specific cancellation policies and may charge a cancellation fee in some cases."

                "Liability: Jack Delivery app may not be held liable for any damages, losses, or injuries resulting from the use of the app or the services provided through the app. Users may also be required to indemnify the app and its affiliates against any claims arising from their use of the app."

              "App Updates: Jack Delivery app may update its terms and conditions at any time without prior notice to the users. Users may be required to agree to the updated terms and conditions before continuing to use the app."
               ),
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



