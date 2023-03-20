import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jack_delivery/translation/translation.dart';
import 'package:jack_delivery/view/home_screen/home_screen.dart';
import 'package:jack_delivery/view/login_screen/login_screen.dart';
import 'package:jack_delivery/view/main_screen/main_screen.dart';
import 'package:jack_delivery/view/organization_category_screen/organization_category_screen.dart';
import 'package:jack_delivery/view/otp_verification_screen/otp_verification.dart';
import 'package:jack_delivery/view/sign_up_screen/sign_up_screen.dart';
import 'package:jack_delivery/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: LocalString(),
        locale: const Locale('en', 'US'),
        theme: ThemeData(
            primarySwatch: createMaterialColor(const Color(0xffF9B334)),
            primaryTextTheme:
                GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme),
            textTheme:
                GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme)),
        home: const MainScreen());
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
