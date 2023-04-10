import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jack_delivery/helper/helper.dart';

import '../../utilities/utilities.dart';

class Auth {
  static Future<Response> signUp(
      {required String name,
      required String crNumber,
      required String email,
      required String phoneNumber,
      required String category,
      required String password,
      }) async {
    Uri url = Uri.parse("$directory/api/register");
    Response response = await http.post(url, body: {
      "organizationName":name,
      "email":email,
      "mobile":phoneNumber,
      "crNumber":crNumber,
      "password":password,
      "category":category,
    });
    return response;
  }
}
