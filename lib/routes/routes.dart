import 'package:get/get.dart';
import 'package:jack_delivery/view/common_screen/splash_screen/splash_screen.dart';
import 'package:jack_delivery/view/common_screen/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:jack_delivery/view/organization_screen/login_screen/login_screen.dart';
import 'package:jack_delivery/view/organization_screen/main_screen/main_screen.dart';
import 'package:jack_delivery/view/organization_screen/organization_category_screen/organization_category_screen.dart';
import 'package:jack_delivery/view/organization_screen/sign_up_screen/sign_up_screen.dart';
import '../view/common_screen/register_as_screen/register_as_screen.dart';
import '../view/organization_screen/looking_for_a_rider_screen/looking_for_a_rider_screen.dart';
import '../view/organization_screen/order_details_screen/order_details_screen.dart';
import '../view/organization_screen/otp_verification_screen/otp_verification.dart';
import 'package:jack_delivery/view/rider_screen/login_screen/login_screen.dart' as rl;
import 'package:jack_delivery/view/rider_screen/sign_up_screen/sign_up_screen.dart' as rs;
import 'package:jack_delivery/view/rider_screen/main_screen/main_screen.dart' as rm;
import '../view/rider_screen/new_order_accept_screen/new_order_accept_screen.dart';
import '../view/rider_screen/otp_verification_screen/otp_verification.dart'as ro;


List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page:()=> const SplashScreen()),
  GetPage(name: "/termAndConditions/", page:()=> const TermsAndConditionScreen()),
  GetPage(name: "/register_as/", page:()=> const RegisterAsScreen()),
  GetPage(name: "/org_category/", page:()=> const OrganizationCategoryScreen()),
  GetPage(name: "/org_login/", page:()=> const LoginScreen()),
  GetPage(name: "/org_sign_up/", page:()=>const SignUpScreen(),),
  GetPage(name: "/org_otp_verify/", page:()=>const OtpVerificationScreen(),),
  GetPage(name: "/org_login/", page: ()=>const LoginScreen()),
  GetPage(name: "/org_main/", page: ()=>const MainScreen()),
  GetPage(name: "/org_looking_for_rider/", page: ()=>const LookingForRiderScreen()),
  GetPage(name: "/org_order_details/", page: ()=>const OrderDetailsScreen()),

  //rider routes
  GetPage(name: "/rider_login/", page:()=> const rl.LoginScreen()),
  GetPage(name: "/rider_sign_up/", page:()=> const rs.SignUpScreen()),
  GetPage(name: "/rider_main/", page:()=> const rm.MainScreen()),
  GetPage(name: "/rider_otp_verify/", page:()=>const ro.OtpVerificationScreen(),),
  GetPage(name: "/rider_new_order/", page:()=>const NewOrderAcceptScreen(),),

];
