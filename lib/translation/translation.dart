import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "term_and_condition_title": "Term And Conditions",
          "agree":"Accept the Term And Conditions",
          "Continue":"Continue",
          "register_as":"Register As",
          "already_user":"Already a user?",
          "login_to_your_account":"Login To your Account",
          "Organization":"Organization",
          "Rider":"Rider",
        },
        'ar_SU': {
          "term_and_condition_title": "شروط وأحكام",
          "agree":"اقبل الشروط والأحكام",
          "Continue":"يكمل",
          "register_as":"سجل باسم",
          "already_user":"بالفعل مستخدم؟",
          "login_to_your_account":"تسجيل الدخول إلى حسابك",
          "Organization":"منظمة",
          "Rider":"رايدر"
        },
      };
}
