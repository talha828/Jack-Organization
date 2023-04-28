import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jack_delivery/helper/helper.dart';

import '../../utilities/utilities.dart';

class Auth {
  static Future<Response> signUp({
    required String name,
    required String crNumber,
    required String email,
    required String phoneNumber,
    required String category,
    required String password,
  }) async {
    Uri url = Uri.parse("$directory/api/register");
    Response response = await http.post(url, body: {
      "organizationName": name,
      "email": email,
      "mobile": phoneNumber,
      "crNumber": crNumber,
      "password": password,
      "category": category,
    });
    return response;
  }

  static Future<Response> riderSignUp({
    required String name,
    required String numberPlate,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    Uri url = Uri.parse("$directory/api/register");
    Response response = await http.post(url, body: {
      "riderName": name,
      "email": email,
      "mobile": phoneNumber,
      "vehiclenumberplate": numberPlate,
      "password": password,
    });
    return response;
  }

  static Future<Response> login(
      {required String email, required String password}) async {
    Uri url = Uri.parse("$directory/api/login");
    Response response = await http.post(url,
        body: {"email": email, "password": password});
    return response;
  }

  static Future<Response> forgetPassword({required String email}){
    Uri url=Uri.parse("https://jackdelivery-full-backend.onrender.com/api/forget-password");
    var response=http.post(url,body: {"email":email});
    return response;
  }
}
